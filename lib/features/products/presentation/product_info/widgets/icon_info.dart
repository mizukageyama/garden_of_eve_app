import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class IconInfo extends StatelessWidget {
  const IconInfo({
    Key? key,
    required this.icon,
    required this.info,
  }) : super(key: key);

  final IconData icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: greenColor,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          info,
          textAlign: TextAlign.center,
          style: quicksandSemiBold.copyWith(
            color: oxfordBlueColor,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
