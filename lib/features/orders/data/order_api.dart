import 'package:garden_of_eve/constants/api_key_holder.dart';
import 'package:garden_of_eve/features/orders/domain/order_items_model.dart';
import 'package:garden_of_eve/utils/dio_network/dio_client.dart';
import 'package:dio/dio.dart';

class OdrerApi {
  final DioClient dioClient = DioClient();

  Future<Response> getOrders(int userId, int page) async {
    try {
      final Response response = await dioClient.get(
        'orders?id=$userId&$page',
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

  Future<Response> createOrder(
    int userId,
    double total,
    int addressId,
    List<OrderItem> orders,
  ) async {
    try {
      final Response response = await dioClient.post(
        'orders',
        data: {
          "user_id": userId,
          "total": total,
          "address_id": addressId,
          "order_items": orders.map((item) => item.toJson()).toList(),
        },
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

  // Future<Response> removeFromCart(int cartId) async {
  //   try {
  //     final Response response = await dioClient.delete(
  //       'cart/$cartId',
  //       options: Options(
  //         headers: {
  //           "content-type": "application/json",
  //           "authorization": "Bearer $apiKey"
  //         },
  //       ),
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
