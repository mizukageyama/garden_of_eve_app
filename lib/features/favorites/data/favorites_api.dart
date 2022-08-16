import 'package:garden_of_eve/constants/api_key_holder.dart';
import 'package:garden_of_eve/utils/dio_network/dio_client.dart';
import 'package:dio/dio.dart';

class FavoritesApi {
  final DioClient dioClient = DioClient();

  Future<Response> getFavorites(int userId, int page) async {
    try {
      final Response response = await dioClient.get(
        'favorites?id=$userId&$page',
        options: Options(
          headers: {
            "content-type": "application/json",
            "authorization": "Bearer ${API.key}"
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
