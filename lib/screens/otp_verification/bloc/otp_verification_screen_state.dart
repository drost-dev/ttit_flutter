part of 'otp_verification_screen_bloc.dart';

abstract class OtpVerificationScreenState extends Equatable {
  const OtpVerificationScreenState();
  
  @override
  List<Object> get props => [];
}

final class OtpVerificationScreenLoading extends OtpVerificationScreenState {}

final class OtpVerificationScreenLoaded extends OtpVerificationScreenState {}

final class OtpVerificationScreenSuccess extends OtpVerificationScreenState {}

final class OtpVerificationScreenError extends OtpVerificationScreenState {
  const OtpVerificationScreenError({required this.e});

  final dynamic e;
}