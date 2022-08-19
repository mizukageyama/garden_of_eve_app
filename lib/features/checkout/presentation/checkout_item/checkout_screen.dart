import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/widgets/step1_shipping_addr.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/widgets/step2_payment.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/widgets/step3_review.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);
  final RxInt _currentStep = 0.obs;
  final RxBool atLastStep = false.obs;

  void tapped(int step) {
    if (atLastStep.value) {
      _currentStep.value = step;
    }
    print('Tapped: ${_currentStep.value}');
  }

  bool checkActive(int value) {
    return atLastStep.value || _currentStep.value >= value;
  }

  void continued() {
    _currentStep.value < 2 ? _currentStep + (1) : null;
    if (_currentStep.value == 2) {
      atLastStep.value = true;
    }
    print('Continuted: ${_currentStep.value}');
  }

  StepState checkState(int step) {
    if (atLastStep.value && step == _currentStep.value) {
      return StepState.indexed;
    }
    if (atLastStep.value && step != _currentStep.value) {
      return StepState.complete;
    }
    if (step == _currentStep.value) {
      return StepState.indexed;
    }
    if (step < _currentStep.value) {
      return StepState.complete;
    }
    return StepState.disabled;
  }

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
        body: Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: greenColor,
              onSurface: neutralGreyColor,
            ),
          ),
          child: Obx(
            () => Stepper(
              physics: const AlwaysScrollableScrollPhysics(),
              currentStep: _currentStep.value,
              onStepTapped: tapped,
              type: StepperType.horizontal,
              steps: [
                Step(
                  title: Text(
                    'Shipping',
                    style: quicksandBold.copyWith(
                      color: checkActive(0) ? greenColor : neutralGreyColor,
                    ),
                  ),
                  content: Step1ShippingAddr(
                    callback: () => continued(),
                  ),
                  isActive: checkActive(0),
                  state: checkState(0),
                ),
                Step(
                  title: Text(
                    'Payment',
                    style: quicksandBold.copyWith(
                      color: checkActive(1) ? greenColor : neutralGreyColor,
                    ),
                  ),
                  content: Step2Payment(
                    callback: () => continued(),
                  ),
                  isActive: checkActive(1),
                  state: checkState(1),
                ),
                Step(
                  title: Text(
                    'Review',
                    style: quicksandBold.copyWith(
                      color: checkActive(2) ? greenColor : neutralGreyColor,
                    ),
                  ),
                  content: Step3Review(
                    callback: () => continued(),
                  ),
                  isActive: checkActive(2),
                  state: checkState(2),
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
        ),
      ),
    );
  }
}
