import 'package:garden_of_eve/features/shipping_address/domain/shipping_addr_model.dart';
import 'package:garden_of_eve/utils/dio_network/dio_client.dart';
import 'package:dio/dio.dart';

class OrderApi {
  final DioClient dioClient = DioClient();

  Future<Response> getOrders(int userId, int page) async {
    try {
      final Response response = await dioClient.get(
        'orders?id=$userId&$page',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> createOrder(
    int userId,
    double total,
    ShippingAddr addr,
    List<Map<String, dynamic>> orders,
  ) async {
    try {
      final Response response = await dioClient.post(
        'orders',
        data: {
          "user_id": userId,
          "total": total,
          "contact_number": addr.contactNumber,
          "address": addr.address,
          "address_owner": addr.fullName,
          "order_items": orders,
        },
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
