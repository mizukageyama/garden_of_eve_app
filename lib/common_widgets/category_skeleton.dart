import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CategorySkeleton extends StatelessWidget {
  const CategorySkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: inactiveGreyColor,
      highlightColor: Colors.grey.shade500,
      child: Container(
        width: 110,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
