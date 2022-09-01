import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class TextTitleSub extends StatelessWidget {
  const TextTitleSub({
    Key? key,
    required this.title,
    required this.subText,
  }) : super(key: key);

  final String title;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: quicksandBold.copyWith(
            fontSize: 15,
            color: darkGreyColor,
          ),
        ),
        Text(
          subText,
          style: quicksandSemiBold.copyWith(
            fontSize: 13,
            color: neutralGreyColor,
          ),
        ),
      ],
    );
  }
}
