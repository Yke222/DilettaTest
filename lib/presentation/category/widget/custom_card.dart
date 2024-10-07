import 'package:flutter/material.dart';

class CustomCardCategory extends StatelessWidget {
  final String nameCategory;
  final Function() func;
  const CustomCardCategory({
    super.key,
    required this.func,
    required this.nameCategory,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: func,
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nameCategory.toUpperCase(),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ));
  }
}
