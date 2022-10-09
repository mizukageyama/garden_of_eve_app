import 'package:garden_of_eve/features/shipping_address/data/shipping_addr_api.dart';
import 'package:garden_of_eve/features/shipping_address/domain/shipping_addr_model.dart';
import 'package:garden_of_eve/utils/dio_network/dio_exception.dart';
import 'package:dio/dio.dart';

class ShippingAddrRepository {
  final ShippingAddrApi _shippingApi = ShippingAddrApi();

  Future<List<ShippingAddr>> getShippingAddr(int userId) async {
    try {
      final response = await _shippingApi.getShippingAddr(userId);
      final Map<String, dynamic> rawData = response.data;
      final addr =
          rawData['data'].map((data) => ShippingAddr.fromJson(data)).toList();
      return List<ShippingAddr>.from(addr);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Map<String, dynamic>> addAddress(int userId, ShippingAddr addr) async {
    try {
      final response = await _shippingApi.addAddress(userId, addr);
      return response.data;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Map<String, dynamic>> updateAddress(
    int userId,
    ShippingAddr addr,
  ) async {
    try {
      final response = await _shippingApi.updateAddress(userId, addr);
      return response.data;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Map<String, dynamic>> deleteAddress(int addrId) async {
    try {
      final response = await _shippingApi.deleteddress(addrId);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
