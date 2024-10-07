import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/config/theme/app_colors.dart';
import 'package:wishlist/features/home/presentation/bloc/home_bloc.dart';
import 'package:wishlist/features/home/presentation/widgets/bottom_nav_bar_fb2_widget.dart';
import 'package:wishlist/features/product/presentation/pages/products_list_page.dart';
import 'package:wishlist/features/user/presentation/pages/user_page.dart';
import 'package:wishlist/features/wishlist/presentation/pages/wish_list_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, int>(
      selector: (state) => state.pageIndex,
      builder: (context, pageIndex) {
        log('pageIndex: $pageIndex');
        return Material(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                  ),
                  child: IndexedStack(
                    sizing: StackFit.expand,
                    index: pageIndex,
                    children: [
                      CupertinoTabView(
                        builder: (context) => const ProductsListPage(),
                        defaultTitle: "Products",
                      ),
                      CupertinoTabView(
                        builder: (context) => const WishListPage(),
                        defaultTitle: "WishList",
                      ),
                      CupertinoTabView(
                        builder: (context) => const UserPage(),
                        defaultTitle: "User",
                      ),
                    ],
                  ),
                ),
              ),
              const BottomNavBarFb2Widget(),
            ],
          ),
        );
      },
    );
  }
}
