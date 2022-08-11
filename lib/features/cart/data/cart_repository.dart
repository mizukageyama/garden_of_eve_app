import 'package:garden_of_eve/features/cart/data/cart_api.dart';
import 'package:garden_of_eve/features/cart/domain/cart_model.dart';
import 'package:garden_of_eve/utils/dio_network/dio_exception.dart';
import 'package:dio/dio.dart';

class CartRepository {
  final CartApi _cartApi = CartApi();
  int totalPages = 0;

  Future<List<Cart>> geCartList(int userId, int page) async {
    try {
      final response = await _cartApi.getCart(userId, page);
      final Map<String, dynamic> rawData = response.data['data'];
      totalPages = rawData['total_pages'];
      final cartItems =
          rawData['cart_items'].map((data) => Cart.fromJson(data)).toList();
      return List<Cart>.from(cartItems);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  int get totalPage => totalPages;
}
