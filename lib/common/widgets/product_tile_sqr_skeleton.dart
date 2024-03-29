import 'package:flutter/material.dart';

class ProductTileSkeleton extends StatelessWidget {
  const ProductTileSkeleton({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256,
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
