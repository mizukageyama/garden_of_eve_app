import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';

class ProductInfoTile extends StatelessWidget {
  const ProductInfoTile({
    Key? key,
    this.isTitle = false,
    required this.text,
  }) : super(key: key);

  final bool isTitle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: (isTitle ? quicksandMedium : quicksandBold).copyWith(
            fontSize: 15,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = bgColor,
          ),
        ),
        Text(
          text,
          style: (isTitle ? quicksandMedium : quicksandBold).copyWith(
            color: neutralGreyColor,
            fontSize: 15,
          ),
        ),
      ],
    );
    // return Text(
    //   text,
    //   style: (isTitle ? quicksandMedium : quicksandBold).copyWith(
    //     color: neutralGreyColor,
    //     fontSize: 15,
    //     foreground: Paint()
    //       ..style = PaintingStyle.stroke
    //       ..strokeWidth = 6
    //       ..color = bgColor,
    //   ),
    //   textAlign: TextAlign.center,
    // );
  }
}
