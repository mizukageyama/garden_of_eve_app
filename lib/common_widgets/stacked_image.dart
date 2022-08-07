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
    this.hasTopLeftRadius = false,
    this.hasTopRightRadius = false,
    this.hasBottomLeftRadius = false,
    this.hasBottomRightRadius = false,
  }) : super(key: key);

  final double containerHeight;
  final double imgHeight;
  final String imgUrl;
  final double? topPosition;
  final bool hasTopLeftRadius;
  final bool hasTopRightRadius;
  final bool hasBottomLeftRadius;
  final bool hasBottomRightRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: containerHeight,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft:
                  hasTopLeftRadius ? const Radius.circular(18) : Radius.zero,
              bottomLeft:
                  hasBottomLeftRadius ? const Radius.circular(18) : Radius.zero,
              topRight:
                  hasTopRightRadius ? const Radius.circular(18) : Radius.zero,
              bottomRight: hasBottomRightRadius
                  ? const Radius.circular(18)
                  : Radius.zero,
            ),
          ),
        ),
        Positioned(
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
