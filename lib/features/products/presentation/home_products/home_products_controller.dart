import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/search_controller.dart';
import 'package:garden_of_eve/features/products/data/product_repository.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/widgets/product_list_view.dart';
import 'package:garden_of_eve/features/products/presentation/product_list/product_list_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class HomeProdController extends GetxController {
  //Repository
  final ProductRepository _productRepo = ProductRepository();
  final SearchController searchController = Get.put(SearchController());

  //Category Variable
  final categoryScroller = ScrollController();
  List<String> categories = List.empty(growable: true);
  RxBool isLoadingCategory = true.obs;
  RxInt activeCategoryIndex = 1.obs;

  //Product per Category Page Bucket
  final PageStorageBucket bucket = PageStorageBucket();
  final List<StatelessWidget> categoryContainer = List.empty(growable: true);

  //Recently Viewed Variable
  final recentScroller = ScrollController();
  RxList<Product> recentlyViewed = RxList.empty(growable: true);

  //Methods
  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  //For Categories
  Future<void> getCategories() async {
    categories = await _productRepo.getCategoryList();
    categories.insert(0, "All");
    isLoadingCategory.value = false;

    if (categories.isNotEmpty) {
      categoryContainer.addAll(
        categories
            .map(
              (data) => ProductListView(
                key: PageStorageKey<String>(data),
                category: data,
              ),
            )
            .toList(),
      );
    }
  }

  StatelessWidget get currentCategoryContainer =>
      categoryContainer[activeCategoryIndex.value];

  void selectCategory(int index) {
    if (index == activeCategoryIndex.value) {
      return;
    }
    if (index == 0) {
      searchController.setSearchKey = '';
      Get.to(() => ProductListScreen());
    } else {
      activeCategoryIndex.value = index;
    }
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
