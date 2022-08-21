import 'package:garden_of_eve/constants/api_key_holder.dart';
import 'package:garden_of_eve/utils/dio_network/dio_client.dart';
import 'package:dio/dio.dart';

class ShippingAddrApi {
  final DioClient dioClient = DioClient();

  Future<Response> getShippingAddr(int userId) async {
    try {
      final Response response = await dioClient.get(
        'user_address/$userId',
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
