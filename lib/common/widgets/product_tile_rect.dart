import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/product_info_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductTileRect extends StatelessWidget {
  const ProductTileRect({
    Key? key,
    required Product product,
    this.width = double.infinity,
  })  : _product = product,
        super(key: key);

  final Product _product;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => ProductInfoScreen(
          product: _product,
        ),
      ),
      child: SizedBox(
        height: 120,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: StackedImage(
                    containerHeight: 95,
                    topPosition: -20,
                    imgHeight: 100,
                    imgUrl: _product.imgUrl,
                    hasTopLeftRadius: true,
                    hasBottomLeftRadius: true,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 95,
                    decoration: const BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: ProductTileText(
                        product: _product,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
