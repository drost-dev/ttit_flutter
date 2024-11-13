part of 'reset_password_screen_bloc.dart';

abstract class ResetPasswordScreenEvent extends Equatable {
  const ResetPasswordScreenEvent();

  @override
  List<Object> get props => [];
}

final class ResetPasswordScreenLoad extends ResetPasswordScreenEvent {}

final class ResetPasswordScreenSendCode extends ResetPasswordScreenEvent {
  const ResetPasswordScreenSendCode({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}