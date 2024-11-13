part of 'reset_password_screen_bloc.dart';

abstract class ResetPasswordScreenState extends Equatable {
  const ResetPasswordScreenState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordScreenLoading extends ResetPasswordScreenState {}

final class ResetPasswordScreenLoaded extends ResetPasswordScreenState {}

final class ResetPasswordScreenCompleted extends ResetPasswordScreenState {
  const ResetPasswordScreenCompleted({required this.email});

  final String email;

  @override
  List<Object> get props => [
        email,
      ];
}

final class ResetPasswordScreenError extends ResetPasswordScreenState {
  const ResetPasswordScreenError(this.e);

  final dynamic e;

  @override
  List<Object> get props => [e];
}
