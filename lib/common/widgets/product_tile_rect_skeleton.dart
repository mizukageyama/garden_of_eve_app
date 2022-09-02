import 'package:flutter/material.dart';

class ProductTileRectSkeleton extends StatelessWidget {
  const ProductTileRectSkeleton({Key? key, required this.width})
      : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      height: 95,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
      ),
    );
  }
}
