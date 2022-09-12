import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/common/widgets/custom_stepper.dart' as cs;
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/checkout_controller.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/widgets/step1_shipping_addr.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/widgets/step2_payment.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/widgets/step3_review.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/widgets/submit_order_bottom_bar.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);
  final _checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: CustomAppBar(
          backgroundColor: darkGreenColor,
          hasBackButton: true,
          title: 'Checkout',
          contentColor: whiteColor,
        ),
        body: Obx(
          () => cs.CutomStepper(
            physics: const AlwaysScrollableScrollPhysics(),
            currentStep: _checkoutController.currentStep,
            onStepTapped: _checkoutController.tapStep,
            type: cs.StepperType.horizontal,
            steps: [
              Step(
                title: Text(
                  'Shipping',
                  style: quicksandBold.copyWith(
                    color: _checkoutController.checkActive(0)
                        ? greenColor
                        : neutralGreyColor,
                  ),
                ),
                content: Step1ShippingAddr(),
                isActive: _checkoutController.checkActive(0),
                state: _checkoutController.checkState(0),
              ),
              Step(
                title: Text(
                  'Payment',
                  style: quicksandBold.copyWith(
                    color: _checkoutController.checkActive(1)
                        ? greenColor
                        : neutralGreyColor,
                  ),
                ),
                content: Step2Payment(),
                isActive: _checkoutController.checkActive(1),
                state: _checkoutController.checkState(1),
              ),
              Step(
                title: Text(
                  'Review',
                  style: quicksandBold.copyWith(
                    color: _checkoutController.checkActive(2)
                        ? greenColor
                        : neutralGreyColor,
                  ),
                ),
                content: Step3Review(),
                isActive: _checkoutController.checkActive(2),
                state: _checkoutController.checkState(2),
              ),
            ],
            controlsBuilder: (context, details) {
              return const SizedBox(
                height: 0,
                width: 0,
              );
            },
          ),
        ),
        bottomNavigationBar: Obx(
          () => Visibility(
            visible: _checkoutController.currentStep == 2,
            child: SubmitOrderBottomBar(),
          ),
        ),
      ),
    );
  }
}
