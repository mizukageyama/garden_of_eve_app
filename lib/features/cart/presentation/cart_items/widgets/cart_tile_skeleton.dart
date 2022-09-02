import 'package:flutter/material.dart';

class CartTileSkeleton extends StatelessWidget {
  const CartTileSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
      ),
    );
  }
}
