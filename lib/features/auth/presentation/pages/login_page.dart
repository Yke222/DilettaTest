import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wishlist/config/extention/size.dart';
import 'package:wishlist/config/theme/app_colors.dart';
import 'package:wishlist/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wishlist/features/auth/presentation/pages/register_page.dart';
import 'package:wishlist/features/home/presentation/pages/home_page.dart';
import 'package:wishlist/utils/services/toast_widget.dart';
import 'package:wishlist/utils/widget/button/primary_button_widget.dart';
import 'package:wishlist/utils/widget/input/text_input_widget.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/auth';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.redirectToHome) {
          context.go(HomePage.routeName);
        }
        if (state.hasError) {
          ToastService(context).showToast(
            title: "Error",
            type: ToastType.error,
            description: "Your email or password is incorrect",
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            shrinkWrap: true,
            children: [
              16.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 16.0.r),
                child: const Text(
                  "Sign in",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              32.verticalSpace,
              TextInputWidget(
                title: "Email",
                focusNode: authBloc.emailFocusNode,
                controller: authBloc.emailController,
                hintText: "example@gmail.com",
                keyboardType: TextInputType.name,
                autofillHints: const [AutofillHints.name],
                paddingHorizontal: 16.r,
              ),
              8.verticalSpace,
              BlocSelector<AuthBloc, AuthState, bool>(
                selector: (state) => state.isShowPassword,
                builder: (context, isShowPassword) {
                  return TextInputWidget(
                    title: "Password",
                    focusNode: authBloc.passwordFocusNode,
                    controller: authBloc.passwordController,
                    hintText: "*********",
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        authBloc.add(const ShowOrHidePasswordAuthEvent());
                      },
                      child: Icon(
                        isShowPassword ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    obscureText: !isShowPassword,
                    autofillHints: const [AutofillHints.newPassword],
                    paddingHorizontal: 16.r,
                  );
                },
              ),
              16.verticalSpace,
              BlocSelector<AuthBloc, AuthState, bool>(
                selector: (state) => state.isLoading,
                builder: (context, loading) {
                  return PrimaryButtonWidget(
                    paddingHorizontal: 16.r,
                    name: "Login",
                    loading: loading,
                    onPressed: () {
                      if (loading) {
                        return;
                      }
                      authBloc.add(
                        const SignInWithEmailAndPasswordAuthEvent(),
                      );
                    },
                  );
                },
              ),
              8.verticalSpace,
              TextButton(
                onPressed: () {
                  context.push(
                    RegisterPage.routeName,
                  );
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
