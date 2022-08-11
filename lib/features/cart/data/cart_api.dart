import 'package:garden_of_eve/utils/dio_network/dio_client.dart';
import 'package:dio/dio.dart';

class CartApi {
  final DioClient dioClient = DioClient();

  final String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOnsiaWQiOjMsImVtYWlsIjoibWFkX21heEBnbWFpbC5jb20iLCJjcmVhdGVkX2F0IjoiMjAyMi0wNi0yOVQyMDozMDoxOS4wMDBaIiwibW9kaWZpZWRfYXQiOiIyMDIyLTA3LTMxVDA4OjEwOjEyLjAwMFoiLCJmaXJzdF9uYW1lIjoiTWFkIiwibGFzdF9uYW1lIjoiTWF4In0sImlhdCI6MTY2MDE5ODQyNSwiZXhwIjoxNjYwMjAyMDI1fQ.HKGVN-Xgb0EN9ot6aVULPArrHDbxlf2po_PMcssRK7I';

  Future<Response> getCart(int userId, int page) async {
    try {
      final Response response = await dioClient.get('cart?id=$userId&$page',
          options: Options(headers: {
            "content-type": "application/json",
            "authorization": "Bearer $apiKey"
          }));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
