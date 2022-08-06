import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/constants.dart';

class ProductTileText extends StatelessWidget {
  const ProductTileText({
    Key? key,
    required this.name,
    required this.desc,
    required this.price,
    this.maxLines = 3,
  }) : super(key: key);

  final String name;
  final String desc;
  final double price;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: quicksandSemiBold.copyWith(
            color: darkGreyColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          desc,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: quicksandSemiBold.copyWith(
            color: neutralGreyColor,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "₱${price.toStringAsFixed(2)}",
          style: quicksandBold.copyWith(
            color: greenColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
