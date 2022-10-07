import 'package:garden_of_eve/features/cart/data/cart_repository.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/features/favorites/data/favorites_repository.dart';
import 'package:garden_of_eve/features/favorites/presentation/favorites/favorites_controller.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/dialogs.dart';
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
      showSnackBar(
        title: success ? 'Success' : 'Failed',
        message: success ? 'Removed from Favorites' : message['message'],
        duration: const Duration(seconds: 1),
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
      showSnackBar(
        title: success ? 'Success' : 'Failed',
        message: message['message'],
        duration: const Duration(seconds: 1),
      );
    }
  }

  Future<void> isFavorite(Product product) async {
    product.setFav = favController.isFavorite(product.id);
  }

  Future<void> addToCart(int userId, int prodId, int qty) async {
    showLoading();
    Map<String, dynamic> message =
        await _cartRepo.addToCart(userId, prodId, qty);
    bool success = message['success'] == 1;
    if (success) {
      await cartListController.getCartData(isRefresh: true);
    }
    dismissDialog();
    showSnackBar(
      title: success ? 'Success' : 'Failed',
      message: message['message'],
    );
  }

  int get qty => quantity.value;

  set setQty(int value) => quantity.value = value;
}
