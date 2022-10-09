import 'package:garden_of_eve/features/profile/data/user_api.dart';
import 'package:garden_of_eve/utils/dio_network/dio_exception.dart';
import 'package:garden_of_eve/utils/utils.dart';

class UserRepository {
  final _userApi = UserApi();

  Future<Map<String, dynamic>> updateUser(
    int userId,
    String firstName,
    String lastName,
  ) async {
    try {
      final response = await _userApi.updateUserInfo(
        userId,
        firstName,
        lastName,
      );
      return response.data;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
