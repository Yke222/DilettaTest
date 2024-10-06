import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '/../core/core.dart';
import '../../../../ui/theme/colors.dart';
import '../../entity/starship_entity.dart';

class DetailsItemBottomSheet extends StatefulWidget {
  const DetailsItemBottomSheet({
    required this.starShipEntity,
    required this.onTapButton,
    super.key,
  });

  final StarShipEntity starShipEntity;
  final VoidCallback onTapButton;

  static void show({
    required BuildContext context,
    required StarShipEntity starShipEntity,
    required VoidCallback onTapButton,
  }) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      isDismissible: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => DetailsItemBottomSheet(
        starShipEntity: starShipEntity,
        onTapButton: onTapButton,
      ),
    );
  }

  @override
  State<DetailsItemBottomSheet> createState() => _DetailsItemBottomSheet();
}

class _DetailsItemBottomSheet extends State<DetailsItemBottomSheet> {
  void _onTapButton() {
    context.pop();
    widget.onTapButton();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          Text(
            widget.starShipEntity.name,
            style: context.textTheme.displaySmall,
          ),
          SizedBox(
            height: 8.h,
          ),
          _TitleDescriptionWidget(
            title: AppStrings.home.starShipDataModel,
            description: widget.starShipEntity.model,
          ),
          _TitleDescriptionWidget(
            title: AppStrings.home.starShipDataSize,
            description: widget.starShipEntity.length,
          ),
          _TitleDescriptionWidget(
            title: AppStrings.home.starShipDataValue,
            description: widget.starShipEntity.costInCredits,
          ),
          _TitleDescriptionWidget(
            title: AppStrings.home.starShipDataClass,
            description: widget.starShipEntity.starshipClass,
          ),
          _TitleDescriptionWidget(
            title: AppStrings.home.starShipDataPassengers,
            description: widget.starShipEntity.passengers,
          ),
          _TitleDescriptionWidget(
            title: AppStrings.home.starShipDataCapacity,
            description: widget.starShipEntity.cargoCapacity,
          ),
          _TitleDescriptionWidget(
            title: AppStrings.home.starShipDataMaxSpeed,
            description: widget.starShipEntity.maxAtmospheringSpeed,
          ),
          TextButton.icon(
            onPressed: _onTapButton,
            label: Text(
              widget.starShipEntity.onTheWishlist
                  ? AppStrings.home.removeFromWishlist
                  : AppStrings.home.addToWishlist,
              style: context.textTheme.labelLarge?.copyWith(
                color: widget.starShipEntity.onTheWishlist
                    ? AppColors.danger
                    : AppColors.info,
              ),
            ),
            icon: Icon(
              widget.starShipEntity.onTheWishlist ? Icons.remove : Icons.add,
              color: widget.starShipEntity.onTheWishlist
                  ? AppColors.danger
                  : AppColors.info,
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleDescriptionWidget extends StatelessWidget {
  const _TitleDescriptionWidget({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleSmall,
        ),
        Text(
          description,
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
