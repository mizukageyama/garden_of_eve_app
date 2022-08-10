import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/products/data/product_repository.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/features/products/presentation/product_list/product_list_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class HomeProdController extends GetxController {
  //Repository
  final ProductRepository _productRepo = ProductRepository();

  //Product Variable
  final productScroller = ScrollController();
  RxList<Product> products = RxList.empty(growable: true);
  RxBool isLoadingProd = true.obs;
  bool productHasMoreData = false;
  int currentPage = 1;
  late int totalPage;

  //Category Variable
  final categoryScroller = ScrollController();
  List<String> categories = List.empty(growable: true);
  RxBool isLoadingCategory = true.obs;
  RxInt activeCategoryIndex = 1.obs;

  //Recently Viewed Variable
  final recentScroller = ScrollController();
  RxList<Product> recentlyViewed = RxList.empty(growable: true);

  //Methods
  @override
  void onInit() async {
    await getCategories();

    productScroller.addListener(() async {
      if (productScroller.position.pixels ==
          productScroller.position.maxScrollExtent) {
        print('Fetching new data...');
        await getProductsData();
      }
    });

    ever(activeCategoryIndex, (activeCategoryIndex) async {
      productScroller.jumpTo(0);
      await getProductsData(isRefresh: true);
    });

    super.onInit();
  }

  //For Categories
  Future<void> getCategories() async {
    categories = await _productRepo.getCategoryList();
    categories.insert(0, "All");
    isLoadingCategory.value = false;

    if (categories.isNotEmpty) {
      await getProductsData(isRefresh: true);
    }
  }

  void selectCategory(int index) {
    if (index == activeCategoryIndex.value) {
      return;
    }
    if (index == 0) {
      Get.to(() => ProductListScreen());
    } else {
      activeCategoryIndex.value = index;
    }
  }

  //For Products
  Future<void> getProductsData({bool isRefresh = false}) async {
    if (isRefresh) {
      isLoadingProd.value = true;
      currentPage = 1;
    } else {
      if (!productHasMoreData) {
        return;
      }
    }

    print(categories[activeCategoryIndex.value]);
    final result = await _productRepo.getProductListByCategory(
      currentPage,
      categories[activeCategoryIndex.value],
    );

    if (isRefresh) {
      products.value = result;
      isLoadingProd.value = false;
    } else {
      products.addAll(result);
    }

    totalPage = _productRepo.totalPagebyCategory;
    productHasMoreData = currentPage < totalPage;

    if (productHasMoreData) currentPage++;
  }

  //For Recently Viewed
  void addRecent(Product viewed) {
    bool containsItem =
        recentlyViewed.any((element) => element.id == viewed.id);

    if (containsItem) {
      recentlyViewed.remove(viewed);
      recentlyViewed.insert(0, viewed);
      return;
    } else {
      recentlyViewed.insert(0, viewed);
    }

    //Should limit 3 items
    if (recentlyViewed.length == 4) {
      recentlyViewed.removeLast();
    }
  }
}
