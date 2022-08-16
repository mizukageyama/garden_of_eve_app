import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductTileSkeleton extends StatelessWidget {
  const ProductTileSkeleton({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: inactiveGreyColor,
      highlightColor: Colors.grey.shade500,
      child: Container(
        height: 256,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
        ),
      ),
    );
  }
}
