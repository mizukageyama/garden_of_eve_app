import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/products/data/product_repository.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProdListController extends GetxController {
  //Repository
  final ProductRepository _productRepo = ProductRepository();

  //Product Variable
  final prodListScroller = ScrollController();
  RxList<Product> prodList = RxList.empty(growable: true);
  RxBool isLoadingProd = true.obs;
  bool productHasMoreData = false;
  int currentPage = 1;
  late int totalPage;

  //Methods
  @override
  void onInit() async {
    print('onInit | ProdListController');
    await _getProductsData(isRefresh: true);
    prodListScroller.addListener(() async {
      if (prodListScroller.position.pixels ==
          prodListScroller.position.maxScrollExtent) {
        print('Fetching new data...');
        await _getProductsData();
      }
    });

    super.onInit();
  }

  //For Products
  Future<void> _getProductsData({bool isRefresh = false}) async {
    if (isRefresh) {
      isLoadingProd.value = true;
      currentPage = 1;
    } else {
      if (!productHasMoreData) {
        return;
      }
    }

    final result = await _productRepo.getProductList(
      currentPage,
    );

    if (isRefresh) {
      prodList.value = result;
      isLoadingProd.value = false;
    } else {
      prodList.addAll(result);
    }

    totalPage = _productRepo.totalPage;
    productHasMoreData = currentPage < totalPage;

    if (productHasMoreData) currentPage++;
  }
}
