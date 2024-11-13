part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent extends Equatable {
  const LoginScreenEvent();

  @override
  List<Object> get props => [];
}

class LoginScreenLoad extends LoginScreenEvent {}

class LoginScreenLogin extends LoginScreenEvent {
  const LoginScreenLogin({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
