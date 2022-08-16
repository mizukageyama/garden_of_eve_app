import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class CheckoutBottomBar extends StatelessWidget {
  const CheckoutBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: whiteColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: neutralGreyColor,
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
          TextFormField(
              minLines: 1,
              style: quicksandSemiBold.copyWith(
                color: darkGreyColor,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                labelStyle: quicksandSemiBold.copyWith(
                  color: neutralGreyColor,
                  fontSize: 14,
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                fillColor: whiteColor,
                labelText: 'Promo Code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: neutralGreyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: neutralGreyColor,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              onFieldSubmitted: (value) {
                print('Submitted: $value');
              }),
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
              Text(
                "₱${(200).toStringAsFixed(2)}",
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
                "₱${(120).toStringAsFixed(2)}",
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
            onTap: () {},
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
