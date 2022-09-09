import 'package:garden_of_eve/constants/api_key_holder.dart';
import 'package:garden_of_eve/features/profile/domain/shipping_addr_model.dart';
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

  Future<Response> addAddress(int userId, ShippingAddr addr) async {
    try {
      final Response response = await dioClient.post(
        'user_address',
        data: {
          "user_id": userId,
          "address": addr.address,
          "full_name": addr.fullName,
          "contact_number": addr.contactNumber,
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

  Future<Response> updateAddress(int userId, ShippingAddr addr) async {
    try {
      final Response response = await dioClient.put(
        'user_address',
        data: {
          "user_id": userId,
          "address": addr.address,
          "full_name": addr.fullName,
          "contact_number": addr.contactNumber,
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

  Future<Map<String, dynamic>> deleteddress(int addrId) async {
    try {
      final Map<String, dynamic> response = await dioClient.delete(
        'user_address/$addrId',
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
