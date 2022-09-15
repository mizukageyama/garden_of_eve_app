import 'package:garden_of_eve/features/authentication/data/auth_api.dart';
import 'package:garden_of_eve/utils/dio_network/dio_exception.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final AuthApi _authApi = AuthApi();

  Future<Map<String, dynamic>> loginUser(String email, String pw) async {
    try {
      final response = await _authApi.loginUser(email, pw);
      return response.data;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Map<String, dynamic>> registerUser(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      final response = await _authApi.registerUser(
        firstName,
        lastName,
        email,
        password,
      );
      return response.data;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
