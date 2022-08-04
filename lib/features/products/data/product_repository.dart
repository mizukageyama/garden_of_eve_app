import 'package:garden_of_eve/features/products/data/product_api.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/dio_network/dio_exception.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  final ProductApi _productApi = ProductApi();

  Future<List<Product>> getProductList() async {
    try {
      List<Product> products = List.empty(growable: true);
      final response = await _productApi.getProducts();
      //All data -> response.data;
      final Map<String, dynamic> rawData = response.data['data'];
      //print(rawData);
      //final List<Product> d =
      final d =
          rawData['products'].map((data) => Product.fromJson(data)).toList();
      // for (final data in rawData) {
      //   products.add(Product.fromJson(data));
      // }
      return List<Product>.from(d);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
