import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/features/cart/data/cart_repository.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductInfoController extends GetxController {
  //Repository
  final CartRepository _cartRepo = CartRepository();
  final RxInt quantity = 1.obs;
  final CartListController cartListController = Get.find();

  Future<void> addToCart(int userId, int prodId, int qty) async {
    Map<String, dynamic> message =
        await _cartRepo.addToCart(userId, prodId, qty);
    bool success = message['success'] == 1;
    if (success) {
      await cartListController.getCartData(isRefresh: true);
    }
    //TO DO: should have a checker for Invalid Token (re login?)
    Get.snackbar(
      success ? 'Failed' : 'Success',
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
  }

  int get qty => quantity.value;

  set setQty(int value) => quantity.value = value;
}
