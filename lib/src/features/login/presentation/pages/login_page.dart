import 'package:auto_route/auto_route.dart';
import 'package:finack/src/core/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../presentation/routing/router.gr.dart';
import '../cubit/login_cubit.dart';
import '../../../../core/utils/context_extensions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return BlocProvider(
      create: (context) => LoginCubit(authService: findInstance()),
      child: Scaffold(
        body: BlocListener<LoginCubit, LoginState>(
          listener: _stateListener,
          child: Padding(
            padding: const EdgeInsets.all(8.0)
                .copyWith(bottom: context.systemPadding.bottom + 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'FinAck',
                      style: textTheme.headline1!.copyWith(
                        color: textTheme.button!.color,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      final cubit = context.read<LoginCubit>();
                      if (state is LoginInitial) {
                        return Align(
                          alignment: Alignment.bottomRight,
                          child: OutlinedButton(
                            onPressed: cubit.login,
                            child: const Text('Login with Google'),
                          ),
                        );
                      } else if (state is LoggingIn) {
                        return const Align(
                          alignment: Alignment.bottomCenter,
                          child: LinearProgressIndicator(),
                        );
                      } else {
                        return const Center();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _stateListener(BuildContext context, LoginState state) {
    final cubit = context.read<LoginCubit>();
    if (state is LoginFailed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.failure.error)),
      );
      cubit.reset();
    } else if (state is LoggedIn) {
      final user = state.user;
      if ((user.phoneNumber ?? '').trim().isNotEmpty) {
        context.router.replace(const DashboardScreen());
      } else {
        context.router.replace(const PhoneVerificationScreen());
      }
    }
  }
}
