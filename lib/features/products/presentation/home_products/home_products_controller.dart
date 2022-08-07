import 'package:garden_of_eve/features/products/data/product_repository.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class HomeProdController extends GetxController {
  //Repository
  final ProductRepository _productRepo = ProductRepository();

  //Local Variables
  List<Product> products = List.empty(growable: true);
  List<String> categories = List.empty(growable: true);
  Set<Product> recentlyViewed = {};
  RxBool isLoading = true.obs;
  RxInt activeCategoryIndex = 1.obs;

  //Methods
  Future<List<Product>> getProducts() async {
    final products = await _productRepo.getProductList();
    isLoading.value = false;
    return products;
  }

  Future<List<String>> getCategories() async {
    final categories = await _productRepo.getCategoryList();
    return categories;
  }

  @override
  void onInit() async {
    print('onInit called');
    categories = await getCategories();
    categories.insert(0, "All");
    products = await getProducts();
    recentlyViewed.add(products[4]);
    recentlyViewed.add(products[2]);
    super.onInit();
  }

  void selectCategory(int index) {
    if (index == activeCategoryIndex.value) {
      return;
    }
    activeCategoryIndex.value = index;
  }
}
