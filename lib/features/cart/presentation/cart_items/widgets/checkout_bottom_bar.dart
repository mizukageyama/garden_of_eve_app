import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/common/widgets/custom_text_field.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/checkout_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CheckoutBottomBar extends StatelessWidget {
  CheckoutBottomBar({Key? key}) : super(key: key);
  final CartListController cartListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: neutralGreyColor.withOpacity(.1),
            blurRadius: 1.5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Have a coupon code? Enter here:",
            style: quicksandSemiBold.copyWith(
              fontSize: 13,
              color: neutralGreyColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomTextField(
            labelText: 'Promo Code',
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub total:",
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: neutralGreyColor,
                ),
              ),
              Obx(
                () => Text(
                  "₱${(cartListController.subTotal()).toStringAsFixed(2)}",
                  style: quicksandBold.copyWith(
                    fontSize: 14,
                    color: oxfordBlueColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount:",
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: neutralGreyColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "10%",
                style: quicksandBold.copyWith(
                  fontSize: 14,
                  color: oxfordBlueColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            thickness: 0.9,
            color: neutralGreyColor,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total:",
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: neutralGreyColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "₱${(600).toStringAsFixed(2)}",
                style:
                    quicksandBold.copyWith(fontSize: 16, color: darkGreenColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              if (cartListController.selectedItems.isNotEmpty) {
                Get.to(() => CheckoutScreen());
              } else {
                print('No selected items to checkout');
              }
            },
            child: GradientContainer(
              height: 50,
              child: Center(
                child: Text(
                  'CHECKOUT',
                  textAlign: TextAlign.center,
                  style: quicksandSemiBold.copyWith(
                    fontSize: 14,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
