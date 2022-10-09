import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/common/widgets/custom_text_field.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/checkout_screen.dart';
import 'package:garden_of_eve/utils/dialogs.dart';
import 'package:garden_of_eve/utils/format.dart';
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
          CustomTextField(
            labelText: 'Promo Code',
            controller: cartListController.pCode,
            callback: () => cartListController.checkVoucherCode(),
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
                  "₱${Format.amount(cartListController.subTotal())}",
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
              Obx(
                () => Text(
                  "- ₱${Format.amount(cartListController.calculateLess())}",
                  style: quicksandBold.copyWith(
                    fontSize: 14,
                    color: oxfordBlueColor,
                  ),
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
              Obx(
                () => Text(
                  "₱${Format.amount(cartListController.total())}",
                  style: quicksandBold.copyWith(
                      fontSize: 16, color: darkGreenColor),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              if (cartListController.selectedItems.isNotEmpty) {
                Get.to(() => CheckoutScreen());
              } else {
                showErrorDialog(
                  errorTitle: 'No items selected',
                  errorDescription:
                      'Please select items from cart to proceed checkout',
                );
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
