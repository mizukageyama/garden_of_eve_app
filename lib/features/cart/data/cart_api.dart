import 'package:garden_of_eve/constants/api_key_holder.dart';
import 'package:garden_of_eve/utils/dio_network/dio_client.dart';
import 'package:dio/dio.dart';

class CartApi {
  final DioClient dioClient = DioClient();

  Future<Response> getCart(int userId, int page) async {
    try {
      final Response response = await dioClient.get(
        'cart?id=$userId&$page',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> addToCart(int userId, int prodId, int qty) async {
    try {
      final Response response = await dioClient.post(
        'cart',
        data: {
          "user_id": userId,
          "product_id": prodId,
          "qty": qty,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> removeFromCart(int cartId) async {
    try {
      final Map<String, dynamic> response = await dioClient.delete(
        'cart/$cartId',
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
