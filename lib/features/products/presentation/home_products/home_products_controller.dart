import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/products/data/product_repository.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class HomeProdController extends GetxController {
  //Repository
  final ProductRepository _productRepo = ProductRepository();

  //Local Variables
  RxList<Product> products = RxList.empty(growable: true);
  final productScroller = ScrollController();
  RxBool isLoadingProd = true.obs;
  bool productHasMoreData = false;
  int currentPage = 1;
  late int totalPage;

  List<String> categories = List.empty(growable: true);
  RxBool isLoadingCategory = true.obs;
  RxInt activeCategoryIndex = 1.obs;

  Set<Product> recentlyViewed = {};

  //Methods
  Future<List<Product>> getProducts({bool isRefresh = false}) async {
    final products = await _productRepo.getProductList(currentPage);
    if (products.isEmpty) {
      totalPage = 0;
    } else {
      totalPage = _productRepo.totalPage;
    }
    isLoadingProd.value = false;
    return products;
  }

  @override
  void onInit() async {
    print('onInit called');
    categories = await getCategories();
    categories.insert(0, "All");
    await getProductsData(isRefresh: true);

    productScroller.addListener(() async {
      if (productScroller.position.pixels ==
          productScroller.position.maxScrollExtent) {
        await getProductsData();
        print('At the end!');
      }
    });

    recentlyViewed.add(products[4]);
    recentlyViewed.add(products[2]);
    super.onInit();
  }

  Future<List<String>> getCategories() async {
    final categories = await _productRepo.getCategoryList();
    isLoadingCategory.value = false;
    return categories;
  }

  Future<void> getProductsData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (!productHasMoreData) {
        return;
      }
    }

    final result = await _productRepo.getProductList(currentPage);

    if (isRefresh) {
      products.value = result;
      isLoadingProd.value = false;
    } else {
      products.addAll(result);
    }

    if (products.isEmpty) {
      totalPage = 0;
    } else {
      productHasMoreData = true;
      totalPage = 3; //_productRepo.totalPage;
    }
    print(currentPage);
    if (totalPage == currentPage) {
      print('ala na');
      productHasMoreData = false;
    } else {
      currentPage++;
    }
  }

  void selectCategory(int index) {
    if (index == activeCategoryIndex.value) {
      return;
    }
    activeCategoryIndex.value = index;
  }
}
