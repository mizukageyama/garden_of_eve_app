import 'package:dio/dio.dart';
import 'package:garden_of_eve/utils/dio_network/dio_client.dart';

class ProductApi {
  final DioClient dioClient = DioClient();

  Future<Response> getProducts() async {
    try {
      final Response response = await dioClient.get('/products',
          options: Options(headers: {
            "content-type": "application/json",
          }));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getCategories() async {
    try {
      final Response response = await dioClient.get('/categories',
          options: Options(headers: {
            "content-type": "application/json",
            "authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOnsiaWQiOjMsImVtYWlsIjoibWFkX21heEBnbWFpbC5jb20iLCJjcmVhdGVkX2F0IjoiMjAyMi0wNi0yOVQyMDozMDoxOS4wMDBaIiwibW9kaWZpZWRfYXQiOiIyMDIyLTA3LTMxVDA4OjEwOjEyLjAwMFoiLCJmaXJzdF9uYW1lIjoiTWFkIiwibGFzdF9uYW1lIjoiTWF4In0sImlhdCI6MTY1OTYwMTU1NCwiZXhwIjoxNjU5NjA1MTU0fQ.9JZYMzQ_jNu6WHtUFsyB-_a7g_f7eAoxpoDAXd4Nf3k", // $_tokenKey",
          }));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
