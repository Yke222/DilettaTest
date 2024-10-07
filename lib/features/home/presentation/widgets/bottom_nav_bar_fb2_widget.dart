import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/config/theme/app_colors.dart';
import 'package:wishlist/features/home/presentation/bloc/home_bloc.dart';

class BottomNavBarFb2Widget extends StatelessWidget {
  const BottomNavBarFb2Widget({super.key});

  final primaryColor = const Color.fromARGB(255, 56, 202, 56);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, int>(
      selector: (state) => state.pageIndex,
      builder: (context, pageIndex) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.backgroundTertiary,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                iconSize: 30,
                icon: Icon(
                  Icons.home_outlined,
                  color: pageIndex == 0 ? primaryColor : Colors.grey,
                ),
                onPressed: () {
                  context.read<HomeBloc>().add(const OnPageChangeHomeEvent(0));
                },
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(
                  Icons.favorite_border,
                  color: pageIndex == 1 ? primaryColor : Colors.grey,
                ),
                onPressed: () {
                  context.read<HomeBloc>().add(const OnPageChangeHomeEvent(1));
                },
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(
                  Icons.person_outline,
                  color: pageIndex == 2 ? primaryColor : Colors.grey,
                ),
                onPressed: () {
                  context.read<HomeBloc>().add(const OnPageChangeHomeEvent(2));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
