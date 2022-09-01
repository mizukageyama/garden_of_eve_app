import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/models/payment_options.dart';
import 'package:garden_of_eve/features/profile/domain/shipping_addr_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CheckoutController extends GetxController {
  final RxInt _currentStep = 0.obs;
  final RxBool atLastStep = false.obs;
  final Rxn<ShippingAddr?> shippingAddr = Rxn<ShippingAddr>();
  final Rxn<PaymentOpt?> paymentOption = Rxn<PaymentOpt>();

  int get currentStep => _currentStep.value;

  void tapStep(int step) {
    if (_currentStep.value == 2 || _currentStep.value > step) {
      _currentStep.value = step;
    }
    print('Tapped: ${_currentStep.value}');
  }

  bool checkActive(int value) {
    return atLastStep.value || _currentStep.value >= value;
  }

  void nextStep() {
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

  set shippingAddress(ShippingAddr addr) => shippingAddr.value = addr;

  ShippingAddr get getSelectedAddr => shippingAddr.value!;

  set payment(PaymentOpt payment) => paymentOption.value = payment;

  PaymentOpt get getSelectedPayment => paymentOption.value!;

  Future<void> createOrder() async {
    //show loading
    //save address and get addressId
    //pass data and order_items
  }
}
