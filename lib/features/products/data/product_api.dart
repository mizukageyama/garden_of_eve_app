import 'package:dio/dio.dart';
import 'package:garden_of_eve/utils/dio_network/dio_client.dart';

class ProductApi {
  final DioClient dioClient = DioClient();

  Future<Response> getProducts() async {
    try {
      final Response response = await dioClient.get('/products',
          options: Options(headers: {
            "content-type": "application/json",
            "authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOnsiaWQiOjMsImVtYWlsIjoibWFkX21heEBnbWFpbC5jb20iLCJjcmVhdGVkX2F0IjoiMjAyMi0wNi0yOVQxMjozMDoxOS4wMDBaIiwibW9kaWZpZWRfYXQiOiIyMDIyLTA3LTA4VDA3OjIzOjQ0LjAwMFoiLCJmaXJzdF9uYW1lIjoiTWF4IiwibGFzdF9uYW1lIjoiTWFkIiwiYWRkcmVzcyI6Ikhhd2tpbnMiLCJjb250YWN0X251bWJlciI6IjA5MDk5NDU1NDgxIn0sImlhdCI6MTY1NzYwOTQxMSwiZXhwIjoxNjU3NjEzMDExfQ.g6ynlh9si-T1GFd8kTYoyNVNPQU7zT_VY_AYbokZHvM", // $_tokenKey",
          }));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
