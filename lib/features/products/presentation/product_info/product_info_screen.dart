import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/_common_widgets.dart';
import 'package:garden_of_eve/common_widgets/custom_appbar.dart';
import 'package:garden_of_eve/common_widgets/stacked_image.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';

class ProductInfoScreen extends StatelessWidget {
  const ProductInfoScreen({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          hasBackButton: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 240,
              child: StackedImage(
                containerHeight: 50,
                imgHeight: 230,
                imgUrl: product.imgUrl,
                leftPosition: 30,
                hasTopLeftRadius: true,
                hasTopRightRadius: true,
                radius: 50,
                //topPosition: -5,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ProductTileText(
                  forProductInfo: true,
                  name: product.name,
                  desc: product.description,
                  price: product.price,
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 80,
            child: Row(
              children: [
                Text(
                  "₱${product.price.toStringAsFixed(2)}",
                  style: quicksandSemiBold.copyWith(
                      fontSize: 18, color: darkGreyColor),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: GradientContainer(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    child: Text(
                      'ADD TO CART',
                      textAlign: TextAlign.center,
                      style: quicksandSemiBold.copyWith(
                          fontSize: 14, color: whiteColor),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
