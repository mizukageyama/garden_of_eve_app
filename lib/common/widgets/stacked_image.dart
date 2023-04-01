import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/services/image_dimension.dart';
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
        _displayPlantImage()
      ],
    );
  }

  Widget _displayPlantImage() {
    if (leftPosition != null) {
      return FutureBuilder<double>(
          future: ImageDimension.leftPosition(imgUrl, imgHeight.toInt()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Positioned(
                  left: (snapshot.data!).toDouble(),
                  top: topPosition,
                  child: SizedBox(
                    height: imgHeight,
                    child: CachedNetworkImage(
                      memCacheHeight: 400,
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
                );
              }
            }
            return Positioned(
              left: leftPosition,
              top: topPosition,
              child: SizedBox(
                height: imgHeight,
                child: Center(
                  child: SizedBox(
                    height: 80,
                    child: Lottie.asset(
                      'assets/lottie_files/loading-dots-green.json',
                      repeat: true,
                    ),
                  ),
                ),
              ),
            );
          });
    }

    //default for no leftPosition
    return Positioned(
      top: topPosition,
      child: SizedBox(
        height: imgHeight,
        child: CachedNetworkImage(
          memCacheHeight: 300,
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
    );
  }
}
