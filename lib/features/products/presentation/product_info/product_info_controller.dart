import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/features/cart/data/cart_repository.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/features/favorites/data/favorites_repository.dart';
import 'package:garden_of_eve/features/favorites/presentation/favorites/favorites_controller.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductInfoController extends GetxController {
  //Repository
  final CartRepository _cartRepo = CartRepository();
  final FavoritesRepository _favRepo = FavoritesRepository();
  final RxInt quantity = 1.obs;
  final CartListController cartListController = Get.find();
  final FavoritesController favController = Get.find();

  Future<void> toggleHeartIcon(int userId, Product product) async {
    if (product.isFavorite.value) {
      product.setFav = false;

      product.favId = await favController.getFavoriteId(product.id);

      Map<String, dynamic> message = await _favRepo.removeFromFavorites(
        product.favId!,
      );

      bool success = message['success'] == 1;
      if (success) {
        favController.getFavorites(isRefresh: true);
      } else {
        product.setFav = true;
      }
      Get.snackbar(
        success ? 'Success' : 'Failed',
        success ? 'Removed from Favorites' : message['message'],
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: oxfordBlueColor,
        duration: const Duration(seconds: 1),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } else {
      product.setFav = true;
      Map<String, dynamic> message =
          await _favRepo.addToFavorites(userId, product.id);
      bool success = message['success'] == 1;
      if (success) {
        favController.getFavorites(isRefresh: true);
      } else {
        product.setFav = false;
      }
      Get.snackbar(
        success ? 'Success' : 'Failed',
        message['message'],
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: oxfordBlueColor,
        duration: const Duration(seconds: 1),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  Future<void> isFavorite(Product product) async {
    product.setFav = favController.isFavorite(product.id);
  }

  Future<void> addToCart(int userId, int prodId, int qty) async {
    Map<String, dynamic> message =
        await _cartRepo.addToCart(userId, prodId, qty);
    bool success = message['success'] == 1;
    if (success) {
      await cartListController.getCartData(isRefresh: true);
    }
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
  }

  int get qty => quantity.value;

  set setQty(int value) => quantity.value = value;
}
