import 'dart:async';
import 'package:flutter/material.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ImageDimension {
  static Future<double> leftPosition(String imgUrl, int height) async {
    Size dimension = await _calculateImageDimension(imgUrl, height);
    final double imageWidth = dimension.width;

    if (imageWidth > 220) {
      return (imageWidth / 8) * (-1);
    }
    return 30;
  }

  static Future<Size> _calculateImageDimension(String imgUrl, int height) {
    Completer<Size> completer = Completer();
    Image image = Image(
      image: CachedNetworkImageProvider(
        imgUrl,
        maxHeight: height,
      ),
    );
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
          debugPrint('${size.width}');
        },
      ),
    );
    return completer.future;
  }
}
