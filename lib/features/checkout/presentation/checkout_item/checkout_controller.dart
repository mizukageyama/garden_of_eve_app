import 'package:flutter/material.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CheckoutController extends GetxController {
  final RxInt _currentStep = 0.obs;
  final RxBool atLastStep = false.obs;

  int get currentStep => _currentStep.value;

  void tapStep(int step) {
    if (atLastStep.value || _currentStep.value > step) {
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

  Future<void> createOrder() async {}
}
