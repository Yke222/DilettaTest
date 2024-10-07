part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final bool redirectToHome;

  final bool isShowPassword;

  const AuthState({
    required this.isLoading,
    required this.hasError,
    required this.redirectToHome,
    required this.isShowPassword,
  });

  factory AuthState.initial() => const AuthState(
        isLoading: false,
        hasError: false,
        redirectToHome: false,
        isShowPassword: false,
      );

  AuthState copyWith({
    bool? isLoading,
    bool? hasError,
    bool? redirectToHome,
    bool? isShowPassword,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      redirectToHome: redirectToHome ?? this.redirectToHome,
      isShowPassword: isShowPassword ?? this.isShowPassword,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        hasError,
        redirectToHome,
        isShowPassword,
      ];
}
