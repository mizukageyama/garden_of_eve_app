import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/product_info_controller.dart';
import 'package:garden_of_eve/utils/format.dart';
import 'package:garden_of_eve/utils/utils.dart';

class AddToCartRow extends StatelessWidget {
  AddToCartRow({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  final ProductInfoController _prodInfo = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: neutralGreyColor.withOpacity(.1),
            blurRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      child: Row(
        children: [
          Obx(
            () => Text(
              "₱${Format.amount(product.getPrice * _prodInfo.qty)}",
              style: quicksandSemiBold.copyWith(
                  fontSize: 18, color: darkGreyColor),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _prodInfo.addToCart(3, product.id, _prodInfo.qty),
              child: GradientContainer(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Text(
                  'ADD TO CART',
                  textAlign: TextAlign.center,
                  style: quicksandSemiBold.copyWith(
                      fontSize: 14, color: whiteColor),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
