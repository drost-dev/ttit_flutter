part of 'login_screen_bloc.dart';

abstract class LoginScreenState extends Equatable {
  const LoginScreenState();
  
  @override
  List<Object> get props => [];
}

final class LoginScreenLoading extends LoginScreenState {}

final class LoginScreenLoaded extends LoginScreenState {}

final class LoginScreenCompleted extends LoginScreenState {}

final class LoginScreenError extends LoginScreenState {
  const LoginScreenError({this.e});

  final dynamic e;

  @override
  List<Object> get props => [e];
}