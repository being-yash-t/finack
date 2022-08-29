part of 'phone_verification_cubit.dart';

abstract class PhoneVerificationState extends Equatable {
  const PhoneVerificationState();
}

class PhoneVerificationInitial extends PhoneVerificationState {
  @override
  List<Object> get props => [];
}

class SendingOTP extends PhoneVerificationState {
  const SendingOTP();

  @override
  List<Object?> get props => [];
}

class OTPSent extends PhoneVerificationState {
  final String phoneNumber;
  final String verificationId;

  const OTPSent({required this.phoneNumber, required this.verificationId});

  @override
  List<Object?> get props => [phoneNumber, verificationId];
}

class OtpSendingFailed extends PhoneVerificationState {
  final Failure failure;

  const OtpSendingFailed(this.failure);

  @override
  List<Object?> get props => [failure];
}

class VerifyingOTP extends PhoneVerificationState {
  final String verificationId;
  @override
  List<Object?> get props => [verificationId];

  const VerifyingOTP(this.verificationId);
}

class VerificationSuccessful extends PhoneVerificationState {
  @override
  List<Object?> get props => [];
}

class VerificationFailed extends PhoneVerificationState {
  final Failure failure;

  const VerificationFailed(this.failure);

  @override
  List<Object?> get props => [failure];
}
