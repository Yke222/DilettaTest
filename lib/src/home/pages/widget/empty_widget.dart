import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          width: 150.w,
          height: 100.h,
          'assets/images/empty.png',
        ),
        Text(
          'Nada salvo',
          textAlign: TextAlign.center,
          style: context.textTheme.headlineSmall,
        ),
        Text(
          '''Ainda não tem nada na sua wishlist.''',
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge,
        ),
      ],
    );
  }
}
