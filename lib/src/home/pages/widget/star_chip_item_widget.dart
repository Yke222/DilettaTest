import 'package:flutter/material.dart';

import '/../core/core.dart';
import '../../../../ui/theme/colors.dart';

class StarshipItemWidget extends StatelessWidget {
  const StarshipItemWidget({
    required this.title,
    required this.description,
    required this.onTap,
    required this.onTapButton,
    required this.onTheWishlist,
    super.key,
  });

  final String title;
  final String description;
  final bool onTheWishlist;
  final VoidCallback onTap;
  final VoidCallback onTapButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.bodySmall,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                description,
                style: context.textTheme.bodySmall,
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                child: TextButton.icon(
                  onPressed: onTapButton,
                  label: Text(
                    onTheWishlist
                        ? 'Remover da lista de desejos'
                        : 'Adicionar a lista de desejos',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: onTheWishlist ? AppColors.danger : AppColors.info,
                    ),
                  ),
                  icon: Icon(
                    onTheWishlist ? Icons.remove : Icons.add,
                    color: onTheWishlist ? AppColors.danger : AppColors.info,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
