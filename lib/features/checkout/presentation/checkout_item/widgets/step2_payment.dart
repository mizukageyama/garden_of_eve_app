import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/checkout_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class Step2Payment extends StatelessWidget {
  Step2Payment({Key? key}) : super(key: key);
  final CheckoutController _checkoutController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Step 2'),
        const Text('Payment'),
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
