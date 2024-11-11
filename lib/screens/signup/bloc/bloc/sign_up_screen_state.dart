part of 'sign_up_screen_bloc.dart';

abstract class SignUpScreenState extends Equatable {}

final class SignUpScreenLoading extends SignUpScreenState {
  @override
  List<Object> get props => [];
}

final class SignUpScreenLoaded extends SignUpScreenState {
  @override
  List<Object> get props => [];
}

class SignUpScreenCompleted extends SignUpScreenState {
  SignUpScreenCompleted();

  @override
  List<Object> get props => [];
}

class SignUpScreenError extends SignUpScreenState {
  SignUpScreenError(this.e);

  final dynamic e;

  @override
  List<Object> get props => [e];
}