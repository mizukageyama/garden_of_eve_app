import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_controller.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/product_info_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductTile extends StatelessWidget {
  ProductTile({
    Key? key,
    required Product product,
    this.width = double.infinity,
  })  : _product = product,
        super(key: key);

  final Product _product;
  final double width;
  final HomeProdController homeProdController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductInfoScreen(
            product: _product,
          ),
        );
        Future.delayed(const Duration(seconds: 1), () {
          homeProdController.addRecent(_product);
        });
      },
      child: SizedBox(
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
                  product: _product,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
