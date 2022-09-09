import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/checkout_controller.dart';
import 'package:garden_of_eve/utils/format.dart';
import 'package:garden_of_eve/utils/utils.dart';

class SubmitOrderBottomBar extends StatelessWidget {
  SubmitOrderBottomBar({Key? key}) : super(key: key);
  final CheckoutController _checkoutController = Get.find();

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
                "₱${Format.amount(500)}",
                //"₱${Format.amount(_cartListController.subTotal())}",
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
                "₱${Format.amount(600)}",
                style:
                    quicksandBold.copyWith(fontSize: 16, color: darkGreenColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => _checkoutController.createOrder(),
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
