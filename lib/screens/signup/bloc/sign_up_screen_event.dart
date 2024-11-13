part of 'sign_up_screen_bloc.dart';

abstract class SignUpScreenEvent extends Equatable {}

class SignUpScreenLoad extends SignUpScreenEvent {
  SignUpScreenLoad();

  @override
  List<Object> get props => [];
}

class SignUpScreenRegister extends SignUpScreenEvent {
  SignUpScreenRegister({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  List<Object> get props => [
        name,
        email,
        password,
      ];
}