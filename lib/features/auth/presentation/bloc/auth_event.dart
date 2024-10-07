part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class InitializeAuthEvent extends AuthEvent {

  const InitializeAuthEvent();

  @override
  List<Object> get props => [];
}

class SignInWithEmailAndPasswordAuthEvent extends AuthEvent {

  const SignInWithEmailAndPasswordAuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpWithEmailAndPasswordAuthEvent extends AuthEvent {

  const SignUpWithEmailAndPasswordAuthEvent();

  @override
  List<Object> get props => [];
}

class SignOutAuthEvent extends AuthEvent {

  const SignOutAuthEvent();

  @override
  List<Object> get props => [];
}

class ShowOrHidePasswordAuthEvent extends AuthEvent {

  const ShowOrHidePasswordAuthEvent();

  @override
  List<Object> get props => [];
}
