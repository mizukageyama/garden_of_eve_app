import 'package:garden_of_eve/constants/api_key_holder.dart';
import 'package:garden_of_eve/utils/dio_network/dio_client.dart';
import 'package:dio/dio.dart';

class FavoritesApi {
  final DioClient dioClient = DioClient();

  Future<Response> getFavorites(int userId, int page) async {
    try {
      final Response response = await dioClient.get(
        'favorites?id=$userId&$page',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> addToFav(int userId, int productId) async {
    try {
      final Response response = await dioClient.post(
        'favorites',
        data: {
          "user_id": userId,
          "product_id": productId,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> removeFav(int favId) async {
    try {
      final Map<String, dynamic> response = await dioClient.delete(
        'favorites/$favId',
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
