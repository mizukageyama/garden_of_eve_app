//import 'package:garden_of_eve/constants/api_key_holder.dart';
import 'package:garden_of_eve/utils/dio_network/dio_client.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final DioClient dioClient = DioClient();

  Future<Response> loginUser(String email, String password) async {
    try {
      final Response response = await dioClient.post(
        'auth/login',
        data: {
          "email": email,
          "password": password,
        },
        options: Options(
          headers: {
            "content-type": "application/json",
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> registerUser(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      final Response response = await dioClient.post(
        'auth/register',
        data: {
          "email": email,
          "password": password,
          "first_name": firstName,
          "last_name": lastName,
        },
        options: Options(
          headers: {
            "content-type": "application/json",
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
