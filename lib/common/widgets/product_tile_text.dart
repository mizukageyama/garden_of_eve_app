import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductTileText extends StatelessWidget {
  ProductTileText({
    Key? key,
    required this.product,
    this.maxLines = 3,
    this.forProductInfo = false,
  }) : super(key: key);

  final Product product;
  final int maxLines;
  final bool forProductInfo;
  final RxBool show = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                product.name,
                maxLines: forProductInfo ? null : 1,
                overflow: forProductInfo ? null : TextOverflow.ellipsis,
                style: quicksandSemiBold.copyWith(
                  color: darkGreyColor,
                  fontSize: forProductInfo ? 18 : 16,
                ),
              ),
            ),
            Visibility(
              visible: forProductInfo,
              child: InkWell(
                onTap: () => show.value = !show.value,
                child: Obx(
                  () => Icon(
                    show.value
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: greenColor,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          product.description,
          maxLines: forProductInfo ? null : maxLines,
          overflow: forProductInfo ? null : TextOverflow.ellipsis,
          textAlign: forProductInfo ? TextAlign.justify : null,
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
          child: Row(
            children: [
              Text(
                "₱${product.getPrice.toStringAsFixed(2)}",
                style: quicksandBold.copyWith(
                  color: greenColor,
                  fontSize: 16,
                ),
              ),
              Visibility(
                visible: product.discount != null,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "₱${product.price.toStringAsFixed(2)}",
                    style: quicksandSemiBold.copyWith(
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2,
                      color: greyColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
