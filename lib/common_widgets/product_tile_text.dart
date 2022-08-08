import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class ProductTileText extends StatelessWidget {
  const ProductTileText({
    Key? key,
    required this.name,
    required this.desc,
    required this.price,
    this.maxLines = 3,
    this.forProductInfo = false,
  }) : super(key: key);

  final String name;
  final String desc;
  final double price;
  final int maxLines;
  final bool forProductInfo;

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
            fontSize: forProductInfo ? 18 : 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          desc,
          maxLines: forProductInfo ? null : maxLines,
          overflow: forProductInfo ? null : TextOverflow.ellipsis,
          style: quicksandSemiBold.copyWith(
            color: neutralGreyColor,
            fontSize: 12,
            height: forProductInfo ? 1.7 : null,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Visibility(
          visible: !forProductInfo,
          child: Text(
            "₱${price.toStringAsFixed(2)}",
            style: quicksandBold.copyWith(
              color: greenColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
