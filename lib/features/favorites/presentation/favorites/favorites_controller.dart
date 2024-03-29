import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/user_data_controller.dart';
import 'package:garden_of_eve/features/favorites/data/favorites_repository.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class FavoritesController extends GetxController {
  final FavoritesRepository _favRepo = FavoritesRepository();
  final UserData _user = Get.find();

  final favListScroller = ScrollController();
  RxList<Product> favList = RxList.empty(growable: true);
  bool hasMoreData = false;
  RxBool isLoading = false.obs;
  int currentPage = 1;
  int totalPages = 0;

  @override
  void onInit() {
    getFavorites(isRefresh: true);
    favListScroller.addListener(() async {
      if (favListScroller.position.pixels ==
          favListScroller.position.maxScrollExtent) {
        await getFavorites();
      }
    });
    super.onInit();
  }

  Future<void> getFavorites({bool isRefresh = false}) async {
    if (isRefresh) {
      isLoading.value = true;
      currentPage = 1;
    } else {
      if (!hasMoreData) {
        return;
      }
    }

    if (_user.currentUserId == 0) {
      await Future.delayed(const Duration(seconds: 5));
      //delay to wait for initialization of current user
    }

    final results =
        await _favRepo.geFavorites(_user.currentUserId, currentPage);

    if (isRefresh) {
      favList.value = results;
      isLoading.value = false;
    } else {
      favList.addAll(results);
    }

    totalPages = _favRepo.totalPage;
    hasMoreData = currentPage < totalPages;

    if (hasMoreData) currentPage++;
  }

  bool isFavorite(int productId) {
    if (favList.any((item) => item.id == productId)) {
      return true;
    }
    return false;
  }

  Future<int> getFavoriteId(int productId) async {
    Product favProd = favList.firstWhere((item) => item.id == productId);
    return favProd.favId ?? 0;
  }
}
