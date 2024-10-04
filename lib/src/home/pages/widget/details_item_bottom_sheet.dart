import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/../core/core.dart';
import '../../../../ui/theme/colors.dart';
import '../../entity/starship_entity.dart';

class DetailsItemBottomSheet extends StatefulWidget {
  const DetailsItemBottomSheet({
    required this.starShipEntity,
    required this.onTapAddToList,
    super.key,
  });

  final StarShipEntity starShipEntity;
  final VoidCallback onTapAddToList;

  static void show({
    required BuildContext context,
    required StarShipEntity starShipEntity,
    required VoidCallback onTapAddToList,
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
        onTapAddToList: onTapAddToList,
      ),
    );
  }

  @override
  State<DetailsItemBottomSheet> createState() => _DetailsItemBottomSheet();
}

class _DetailsItemBottomSheet extends State<DetailsItemBottomSheet> {
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
          const SizedBox(
            height: 8,
          ),
          _TitleDescriptionWidget(
            title: 'Modelo',
            description: widget.starShipEntity.model,
          ),
          _TitleDescriptionWidget(
            title: 'Tamanho',
            description: widget.starShipEntity.length,
          ),
          _TitleDescriptionWidget(
            title: 'Valor',
            description: widget.starShipEntity.costInCredits,
          ),
          _TitleDescriptionWidget(
            title: 'Classe',
            description: widget.starShipEntity.starshipClass,
          ),
          _TitleDescriptionWidget(
            title: 'Capacidade de passageiros',
            description: widget.starShipEntity.passengers,
          ),
          _TitleDescriptionWidget(
            title: 'Capacidade de carga',
            description: widget.starShipEntity.cargoCapacity,
          ),
          _TitleDescriptionWidget(
            title: 'Velocidade máxima',
            description: widget.starShipEntity.maxAtmospheringSpeed,
          ),
          TextButton.icon(
            onPressed: widget.onTapAddToList,
            label: const Text('Adicionar a lista de desejos'),
            icon: const Icon(Icons.add),
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
