import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/models/payment_options.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_items.dart';
import 'package:garden_of_eve/features/orders/data/order_repository.dart';
import 'package:garden_of_eve/features/orders/domain/order_items_model.dart';
import 'package:garden_of_eve/features/profile/domain/shipping_addr_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CheckoutController extends GetxController {
  final RxInt _currentStep = 0.obs;
  final RxBool atLastStep = false.obs;
  final Rxn<ShippingAddr?> shippingAddr = Rxn<ShippingAddr>();
  final Rxn<PaymentOpt?> paymentOption = Rxn<PaymentOpt>();
  final OrderRepository _orderRepo = OrderRepository();

  @override
  void onInit() {
    payment = paymentOptions[0];
    super.onInit();
  }

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

  ShippingAddr? get getSelectedAddr => shippingAddr.value;

  set payment(PaymentOpt payment) => paymentOption.value = payment;

  PaymentOpt? get getSelectedPayment => paymentOption.value;

  List<Map<String, dynamic>> orderItems(List<OrderItem> orders) {
    return orders
        .map((item) => {
              "cart_id": item.cartId ?? 0,
              "id": item.id,
              "description": item.description,
            })
        .toList();
  }

  Future<void> createOrder(
    int userId,
    double total,
    List<OrderItem> orders,
  ) async {
    //show loading
    print('loading...');
    List<Map<String, dynamic>> orderItemsMapped = orderItems(orders);
    Map<String, dynamic> message = await _orderRepo.createOrder(
      userId,
      total,
      getSelectedAddr!,
      orderItemsMapped,
    );
    bool success = message['success'] == 1;
    //TO DO: should have a checker for Invalid Token (re login?)
    Get.snackbar(
      success ? 'Success' : 'Failed',
      message['message'],
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: oxfordBlueColor,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
    //refresh cart
    //show success dialog, then get back?
  }
}
