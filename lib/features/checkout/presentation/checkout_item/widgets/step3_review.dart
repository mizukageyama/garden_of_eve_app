import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/checkout_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class Step3Review extends StatelessWidget {
  Step3Review({Key? key}) : super(key: key);
  final CheckoutController _checkoutController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please confirm and submit your order',
          style: quicksandSemiBold.copyWith(
            fontSize: 17,
            color: oxfordBlueColor,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'By clicking submit order, you agree ',
          style: quicksandSemiBold.copyWith(
            fontSize: 14,
            color: neutralGreyColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: neutralGreyColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping Address',
                style: quicksandSemiBold.copyWith(
                  fontSize: 15,
                  color: oxfordBlueColor,
                ),
              ),
              Text(
                'Edit',
                style: quicksandSemiBold.copyWith(
                  fontSize: 15,
                  color: greenColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(
              color: neutralGreyColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment',
                style: quicksandSemiBold.copyWith(
                  fontSize: 15,
                  color: oxfordBlueColor,
                ),
              ),
              Text(
                'Edit',
                style: quicksandSemiBold.copyWith(
                  fontSize: 15,
                  color: greenColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
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
    );
  }
}
