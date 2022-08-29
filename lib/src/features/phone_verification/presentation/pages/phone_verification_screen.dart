import 'package:auto_route/auto_route.dart';
import 'package:finack/src/core/constants/firebase.dart';
import 'package:finack/src/core/constants/paddings.dart';
import 'package:finack/src/core/dependency_injection.dart';
import 'package:finack/src/core/services/auth_service.dart';
import 'package:finack/src/core/services/firestore_service.dart';
import 'package:finack/src/core/utils/context_extensions.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/phone_verification_cubit.dart';
import '../../../../presentation/routing/router.gr.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return BlocProvider(
      create: (context) => PhoneVerificationCubit(authService: findInstance()),
      child: Scaffold(
        body: BlocConsumer<PhoneVerificationCubit, PhoneVerificationState>(
          listener: _stateListener,
          builder: (context, state) {
            final cubit = context.read<PhoneVerificationCubit>();
            return Form(
              key: cubit.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state is PhoneVerificationInitial) ...[
                      Text('Phone verification', style: textTheme.headline6),
                      TextFormField(
                        controller: cubit.phoneController,
                        decoration: InputDecoration(
                          prefixText: '+$kCountryCode ',
                          hintText: 'XXXXX-XXXXX',
                          suffixIcon: IconButton(
                            icon: const Icon(
                              FluentIcons.chevron_right_20_regular,
                            ),
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.sendOtp();
                              }
                            },
                          ),
                        ),
                      ),
                      padding8,
                    ] else if (state is SendingOTP || state is VerifyingOTP)
                      const LinearProgressIndicator()
                    else if (state is OTPSent) ...[
                      Text(
                        'OTP sent - ${state.phoneNumber}',
                        style: textTheme.headline5,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: cubit.otpController,
                        decoration: InputDecoration(
                          hintText: 'XXXXX',
                          suffixIcon: IconButton(
                            icon: const Icon(
                              FluentIcons.chevron_right_20_regular,
                            ),
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.verifyOtp();
                              }
                            },
                          ),
                        ),
                      ),
                      padding8,
                    ] else if (state is VerificationSuccessful)
                      const Center()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _stateListener(BuildContext context, PhoneVerificationState state) {
    final cubit = context.read<PhoneVerificationCubit>();
    if (state is OtpSendingFailed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.failure.error)),
      );
      cubit.reset();
    } else if (state is VerificationSuccessful) {
      context.router.replace(const DashboardScreen());
      findInstance<FirestoreHelper>().addUpdateUserData(
        findInstance<AuthService>().currentUser!,
      );
    } else if (state is VerificationFailed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.failure.error)),
      );
      cubit.clearOTP();
    }
  }
}
