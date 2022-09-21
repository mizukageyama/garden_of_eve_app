import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/products/data/product_repository.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProdByCategoryController extends GetxController {
  //Repository
  final ProductRepository _productRepo = ProductRepository();
  final HomeProdController controller = Get.find();

  //Product Variable
  final productScroller = ScrollController();
  RxList<Product> products = RxList.empty(growable: true);
  RxBool isLoadingProd = true.obs;
  bool productHasMoreData = false;
  int currentPage = 1;
  late int totalPage;
  String prodCategory;

  ProdByCategoryController(this.prodCategory);

  //Methods
  @override
  void onInit() {
    getProductsData(isRefresh: true);
    productScroller.addListener(() async {
      if (productScroller.position.pixels ==
          productScroller.position.maxScrollExtent) {
        print('Fetching new data...');
        await getProductsData();
      }
    });
    super.onInit();
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

    final result = await _productRepo.getProductListByCategory(
      currentPage,
      prodCategory,
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
}
