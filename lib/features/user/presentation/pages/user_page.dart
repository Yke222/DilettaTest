import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wishlist/config/extention/size.dart';
import 'package:wishlist/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wishlist/features/auth/presentation/pages/login_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            "User",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        32.verticalSpace,
        TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(const SignOutAuthEvent());
            context.go(LoginPage.routeName);
          },
          child: const Text("Exit"),
        )
      ],
    );
  }
}
