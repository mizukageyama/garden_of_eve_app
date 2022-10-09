import 'package:garden_of_eve/features/orders/data/order_api.dart';
import 'package:garden_of_eve/features/orders/domain/order_model.dart';
import 'package:garden_of_eve/features/shipping_address/domain/shipping_addr_model.dart';
import 'package:garden_of_eve/utils/dio_network/dio_exception.dart';
import 'package:dio/dio.dart';

class OrderRepository {
  final OrderApi _orderApi = OrderApi();
  int totalPages = 0;

  Future<List<Order>> geCartList(int userId, int page) async {
    try {
      final response = await _orderApi.getOrders(userId, page);
      final Map<String, dynamic> rawData = response.data['data'];
      totalPages = rawData['total_pages'];
      final orders =
          rawData['orders'].map((data) => Order.fromJson(data)).toList();
      return List<Order>.from(orders);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  int get totalPage => totalPages;

  Future<Map<String, dynamic>> createOrder(
    int userId,
    double total,
    ShippingAddr addr,
    List<Map<String, dynamic>> orders,
  ) async {
    try {
      final response = await _orderApi.createOrder(userId, total, addr, orders);
      return response.data;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
