import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    Key? key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.height,
    this.width,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            darkGreenColor,
            lightGreenColor,
          ],
        ),
        shape: shape,
      ),
      child: child,
    );
  }
}
