import 'package:garden_of_eve/features/favorites/data/favorites_api.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/dio_network/dio_exception.dart';
import 'package:dio/dio.dart';

class FavoritesRepository {
  final FavoritesApi _favApi = FavoritesApi();
  int totalPages = 0;

  Future<List<Product>> geFavorites(int userId, int page) async {
    try {
      final response = await _favApi.getFavorites(userId, page);
      final Map<String, dynamic> rawData = response.data['data'];
      totalPages = rawData['total_pages'];
      final favProduct =
          rawData['favorites'].map((data) => Product.fromJson(data)).toList();
      return List<Product>.from(favProduct);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Map<String, dynamic>> addToFavorites(int userId, int productId) async {
    try {
      final response = await _favApi.addToFav(userId, productId);
      return response.data;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Map<String, dynamic>> removeFromFavorites(int favId) async {
    try {
      final response = await _favApi.removeFav(favId);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  int get totalPage => totalPages;
}
