import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/checkout_controller.dart';
import 'package:garden_of_eve/utils/format.dart';
import 'package:garden_of_eve/utils/utils.dart';

class SubmitOrderBottomBar extends StatelessWidget {
  SubmitOrderBottomBar({Key? key}) : super(key: key);
  final CheckoutController _checkoutController = Get.find();
  final CartListController _cartController = Get.find();

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
              // Obx(
              //   () =>
              Text(
                //"₱${Format.amount(500)}",
                "₱${Format.amount(_cartController.subTotal())}",
                style: quicksandBold.copyWith(
                  fontSize: 14,
                  color: oxfordBlueColor,
                ),
              ),
              // ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Fee:",
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: neutralGreyColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "₱${Format.amount(120)}",
                style: quicksandBold.copyWith(
                  fontSize: 14,
                  color: oxfordBlueColor,
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
                "- ₱${Format.amount(_cartController.calculateLess())}",
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
                "₱${Format.amount(_cartController.total() + 120)}",
                style:
                    quicksandBold.copyWith(fontSize: 16, color: darkGreenColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              await _checkoutController.createOrder(
                1,
                _cartController.total(),
                _cartController.orderItems(),
              );
            },
            child: GradientContainer(
              borderRadius: BorderRadius.circular(10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Center(
                child: Text(
                  'Submit Order',
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
