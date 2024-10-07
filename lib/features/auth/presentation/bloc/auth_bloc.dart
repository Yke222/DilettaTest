import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/auth/domain/usecases/sign_in_email_password.dart';
import 'package:wishlist/features/auth/domain/usecases/sign_out.dart';
import 'package:wishlist/features/auth/domain/usecases/sign_up_email_password.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();

  final SignInEmailAndPasswordUseCase _signInEmailAndPasswordUseCase;
  final SignUpEmailAndPasswordUseCase _signUpEmailAndPasswordUseCase;
  final SignOutUseCase _signOutUseCase;

  AuthBloc(
    this._signInEmailAndPasswordUseCase,
    this._signUpEmailAndPasswordUseCase,
    this._signOutUseCase,
  ) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) {});
    on<InitializeAuthEvent>(_initialize);
    on<SignInWithEmailAndPasswordAuthEvent>(_onSignInWithEmailAndPassword);
    on<SignUpWithEmailAndPasswordAuthEvent>(_signUpWithEmailAndPassword);
    on<SignOutAuthEvent>(_signOut);
    on<ShowOrHidePasswordAuthEvent>(_showOrHidePassword);
  }

  Future<void> _initialize(
    InitializeAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState.initial());
  }

  Future<void> _onSignInWithEmailAndPassword(
    SignInWithEmailAndPasswordAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      hasError: false,
      isLoading: false,
    ));
    if (emailController.text.isEmpty) {
      emit(state.copyWith(
        hasError: true,
      ));
      return;
    }
    if (passwordController.text.isEmpty) {
      emit(state.copyWith(
        hasError: true,
      ));
      return;
    }
    emit(state.copyWith(
      isLoading: true,
    ));
    await _signInEmailAndPasswordUseCase(
      params: SignInEmailAndPasswordUseCaseParams(
        emailController.text,
        passwordController.text,
      ),
    ).then((value) {
      emit(state.copyWith(
        isLoading: false,
        redirectToHome: true,
      ));
    }).catchError((error) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
      ));
    });
  }

  Future<void> _signUpWithEmailAndPassword(
    SignUpWithEmailAndPasswordAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    if (emailController.text.isEmpty) {
      emit(state.copyWith(
        hasError: true,
      ));
      return;
    }
    if (passwordController.text.isEmpty) {
      emit(state.copyWith(
        hasError: true,
      ));
      return;
    }
    emit(state.copyWith(
      isLoading: true,
    ));
    await _signUpEmailAndPasswordUseCase(
      params: SignUpEmailAndPasswordUseCaseParams(
        emailController.text,
        passwordController.text,
      ),
    ).then((value) {
      emit(state.copyWith(
        isLoading: false,
        redirectToHome: true,
      ));
    }).catchError((error) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
      ));
    });
  }

  Future<void> _signOut(
    SignOutAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _signOutUseCase();
  }

  Future<void> _showOrHidePassword(
    ShowOrHidePasswordAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      isShowPassword: !state.isShowPassword,
    ));
  }
}
