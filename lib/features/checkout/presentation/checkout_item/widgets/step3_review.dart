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
      children: [
        Text('Step 3'),
        Text('Review'),
        InkWell(
          onTap: () => _checkoutController.createOrder(),
          child: GradientContainer(
            borderRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
              child: Text(
                'Create Order',
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
