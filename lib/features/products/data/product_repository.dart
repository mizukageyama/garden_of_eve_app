import 'package:garden_of_eve/features/products/data/product_api.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/dio_network/dio_exception.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  final ProductApi _productApi = ProductApi();
  int totalPagesByCategory = 0;
  int totalPages = 0;

  Future<List<Product>> getProductListByCategory(
      int page, String category) async {
    try {
      final response = await _productApi.getProductsByCategory(page, category);
      final Map<String, dynamic> rawData = response.data['data'];
      totalPagesByCategory = rawData['total_pages'];
      final products =
          rawData['products'].map((data) => Product.fromJson(data)).toList();
      return List<Product>.from(products);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<List<Product>> getProductList(int page) async {
    try {
      final response = await _productApi.getProducts(page);
      final Map<String, dynamic> rawData = response.data['data'];
      totalPages = rawData['total_pages'];
      final products =
          rawData['products'].map((data) => Product.fromJson(data)).toList();
      return List<Product>.from(products);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  get totalPagebyCategory => totalPagesByCategory;

  get totalPage => totalPages;

  Future<List<String>> getCategoryList() async {
    try {
      final response = await _productApi.getCategories();
      final categories =
          response.data['data'].map((data) => data['name']).toList();
      return List<String>.from(categories);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
