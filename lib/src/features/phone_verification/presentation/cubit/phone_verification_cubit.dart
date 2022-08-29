import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finack/src/core/constants/firebase.dart';
import 'package:finack/src/core/errors/failures.dart';
import 'package:finack/src/core/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'phone_verification_state.dart';

class PhoneVerificationCubit extends Cubit<PhoneVerificationState> {
  final AuthService authService;

  final GlobalKey<FormState> formKey = GlobalKey();

  PhoneVerificationCubit({
    required this.authService,
  }) : super(PhoneVerificationInitial());

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  String get countryCode => kCountryCode;

  void reset() => emit(PhoneVerificationInitial());

  void clearOTP() {
    assert(state is VerifyingOTP);
    otpController.clear();
    emit(
      OTPSent(
        phoneNumber: countryCode + phoneController.text,
        verificationId: (state as VerifyingOTP).verificationId,
      ),
    );
  }

  void sendOtp() async {
    await authService.verifyPhone(
      '+' + countryCode + phoneController.text,
      verificationCompleted: verificationComplete,
      verificationFailed: (exception) => verificationFailed(
        UnknownFailure(exception.message ?? kUnknownError),
      ),
      codeSent: (verificationId, _) => emit(
        OTPSent(
          phoneNumber: countryCode + phoneController.text,
          verificationId: verificationId,
        ),
      ),
      codeRetrievalTimeout: (_) {},
    );
  }

  void verifyOtp() {
    assert(state is OTPSent);
    final verificationId = (state as OTPSent).verificationId;
    emit(VerifyingOTP(verificationId));
    verificationComplete(
      authService.createPhoneCredential(verificationId, otpController.text),
    );
  }

  void verificationComplete(PhoneAuthCredential credential) async {
    try {
      await authService.savePhoneCredential(credential);
      emit(VerificationSuccessful());
    } catch (ex) {
      verificationFailed(UnknownFailure(ex.toString()));
    }
  }

  void verificationFailed(Failure failure) => emit(VerificationFailed(failure));
}
