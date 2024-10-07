import 'package:diletta_test/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories(
      {super.key, required this.categories, required this.onItemSelected, required this.selectedCategory});

  final List<String> categories;
  final Function(String) onItemSelected;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category == selectedCategory;
          return GestureDetector(
            onTap: () => onItemSelected(category),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Chip(
                label: CustomText(description: category),
                backgroundColor: isSelected ? Colors.black : Colors.white,
                labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
