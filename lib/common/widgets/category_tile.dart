import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.categoryName,
  }) : super(key: key);
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 18,
      ),
      borderRadius: BorderRadius.circular(20),
      child: Text(
        categoryName,
        style: quicksandBold.copyWith(
          color: whiteColor,
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
