import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/utils/utils.dart';

class StackedImage extends StatelessWidget {
  const StackedImage({
    Key? key,
    required this.containerHeight,
    required this.imgHeight,
    required this.imgUrl,
    this.topPosition,
    this.leftPosition,
    this.radius = 18,
    this.hasTopLeftRadius = false,
    this.hasTopRightRadius = false,
    this.hasBottomLeftRadius = false,
    this.hasBottomRightRadius = false,
  }) : super(key: key);

  final double containerHeight;
  final double imgHeight;
  final String imgUrl;
  final double? topPosition;
  final double? leftPosition;
  final bool hasTopLeftRadius;
  final bool hasTopRightRadius;
  final bool hasBottomLeftRadius;
  final bool hasBottomRightRadius;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: containerHeight,
          decoration: BoxDecoration(
            border: Border.all(width: 0, color: whiteColor),
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: hasTopLeftRadius ? Radius.circular(radius) : Radius.zero,
              bottomLeft:
                  hasBottomLeftRadius ? Radius.circular(radius) : Radius.zero,
              topRight:
                  hasTopRightRadius ? Radius.circular(radius) : Radius.zero,
              bottomRight:
                  hasBottomRightRadius ? Radius.circular(radius) : Radius.zero,
            ),
          ),
        ),
        Positioned(
          left: leftPosition,
          top: topPosition,
          child: SizedBox(
            height: imgHeight,
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              errorWidget: (context, url, error) => Center(
                child: Text(
                  'Could not load image',
                  textAlign: TextAlign.center,
                  style: quicksandMedium.copyWith(
                    color: neutralGreyColor,
                    fontSize: 13.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
