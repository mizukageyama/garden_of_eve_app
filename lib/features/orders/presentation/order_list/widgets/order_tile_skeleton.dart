import 'package:flutter/material.dart';
import 'dart:math';

class OrderTileSkeleton extends StatelessWidget {
  const OrderTileSkeleton({Key? key}) : super(key: key);

  double get randomHeight => (80 + Random().nextInt(210 - 80)).toDouble();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: randomHeight,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
  }
}
