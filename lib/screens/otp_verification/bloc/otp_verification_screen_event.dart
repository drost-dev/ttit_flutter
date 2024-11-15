part of 'otp_verification_screen_bloc.dart';

abstract class OtpVerificationScreenEvent extends Equatable {
  const OtpVerificationScreenEvent();

  @override
  List<Object> get props => [];
}

class OtpVerificationScreenLoad extends OtpVerificationScreenEvent {}

class OtpVerificationScreenSignIn extends OtpVerificationScreenEvent {
  const OtpVerificationScreenSignIn({
    required this.email,
    required this.otpCode,
  });

  final String email;
  final String otpCode;

  @override
  List<Object> get props => [
        email,
        otpCode,
      ];
}

class OtpVerificationScreenResend extends OtpVerificationScreenEvent {
  const OtpVerificationScreenResend({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}
