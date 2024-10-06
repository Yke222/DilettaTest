import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/../core/core.dart';
import '../../../../ui/theme/colors.dart';

class StarshipItemWidget extends StatelessWidget {
  const StarshipItemWidget({
    required this.title,
    required this.description,
    required this.starShipClass,
    required this.onTap,
    required this.onTapButton,
    required this.onTheWishlist,
    super.key,
  });

  final String title;
  final String description;
  final String starShipClass;
  final bool onTheWishlist;
  final VoidCallback onTap;
  final VoidCallback onTapButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.gray,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.headlineMedium,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.home.starShipDataModel,
                    style: context.textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    description,
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.home.starShipDataClass,
                    style: context.textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    starShipClass,
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: onTap,
                    label: Text(
                       AppStrings.home.details,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: AppColors.info,
                      ),
                    ),
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.info,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: onTapButton,
                    label: Text(
                      onTheWishlist
                          ? AppStrings.home.removeFromWishlist
                          : AppStrings.home.addToWishlist,
                      style: context.textTheme.labelLarge?.copyWith(
                        color:
                            onTheWishlist ? AppColors.danger : AppColors.info,
                      ),
                    ),
                    icon: Icon(
                      onTheWishlist ? Icons.remove : Icons.add,
                      color: onTheWishlist ? AppColors.danger : AppColors.info,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
