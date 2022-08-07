import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/product_tile_text.dart';
import 'package:garden_of_eve/common_widgets/stacked_image.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required Product product,
    this.width = double.infinity,
  })  : _product = product,
        super(key: key);
  final Product _product;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 256,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          StackedImage(
            containerHeight: 40,
            topPosition: -100,
            imgHeight: 140,
            imgUrl: _product.imgUrl,
            hasTopLeftRadius: true,
            hasTopRightRadius: true,
          ),
          Container(
            height: 116,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Center(
              child: ProductTileText(
                name: _product.name,
                desc: _product.description,
                price: _product.price,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
