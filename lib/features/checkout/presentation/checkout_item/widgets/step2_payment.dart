import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/checkout_controller.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/radio_step_controller.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/widgets/expandable_container.dart';
import 'package:garden_of_eve/utils/utils.dart';

class Step2Payment extends StatelessWidget {
  Step2Payment({Key? key}) : super(key: key);
  final CheckoutController _checkoutController = Get.find();
  final _step2 = Get.put(RadioStepController(optionLength: 4), tag: 'step2');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose a payment method',
          style: quicksandSemiBold.copyWith(
            fontSize: 17,
            color: oxfordBlueColor,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'You will not be charged until you review this order on the next page.',
          style: quicksandSemiBold.copyWith(
            fontSize: 14,
            color: neutralGreyColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ExpandableRadioOpt(
          title: Row(
            children: [
              Image.asset(
                'assets/icons/mastercard.png',
                height: 24,
                width: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Debit/Credit Card',
                style: quicksandMedium.copyWith(
                  fontSize: 15,
                  color: darkGreyColor,
                ),
              ),
            ],
          ),
          content: const Text(
            'Coming Soon...',
          ),
          radioValue: 1,
          stepController: _step2,
        ),
        const SizedBox(
          height: 20,
        ),
        ExpandableRadioOpt(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/icons/paypal.png',
                height: 24,
                width: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Paypal',
                style: quicksandMedium.copyWith(
                  fontSize: 15,
                  color: darkGreyColor,
                ),
              ),
            ],
          ),
          content: const Text(
            'Coming Soon...',
          ),
          radioValue: 2,
          stepController: _step2,
        ),
        const SizedBox(
          height: 20,
        ),
        ExpandableRadioOpt(
          title: Row(
            children: [
              Image.asset(
                'assets/icons/gcash.png',
                height: 24,
                width: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'GCash',
                style: quicksandMedium.copyWith(
                  fontSize: 15,
                  color: darkGreyColor,
                ),
              ),
            ],
          ),
          content: const Text(
            'Coming Soon...',
          ),
          radioValue: 3,
          stepController: _step2,
        ),
        const SizedBox(
          height: 20,
        ),
        ExpandableRadioOpt(
          title: Row(
            children: [
              Image.asset(
                'assets/icons/cod2.png',
                height: 24,
                width: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Cash on Delivery',
                style: quicksandMedium.copyWith(
                  fontSize: 15,
                  color: darkGreyColor,
                ),
              ),
            ],
          ),
          content: const SizedBox(
            height: 0,
            width: 0,
          ),
          radioValue: 4,
          stepController: _step2,
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () => _checkoutController.nextStep(),
          child: GradientContainer(
            borderRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
              child: Text(
                'Confirm and continue',
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
