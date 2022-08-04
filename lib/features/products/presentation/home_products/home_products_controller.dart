import 'package:garden_of_eve/features/products/data/product_repository.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class HomeProdController extends GetxController {
  //Repository
  final ProductRepository _productRepo = ProductRepository();

  //Local Variables
  List<Product> products = List.empty(growable: true);

  //Methods
  Future<List<Product>> getProducts() async {
    final users = await _productRepo.getProductList();
    return users;
  }
}
