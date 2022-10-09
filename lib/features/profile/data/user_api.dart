import 'package:garden_of_eve/utils/dio_network/dio_client.dart';
import 'package:garden_of_eve/utils/utils.dart';

class UserApi {
  final DioClient dioClient = DioClient();

  Future<Response> updateUserInfo(
    int userId,
    String firstName,
    String lastName,
  ) async {
    try {
      final Response response = await dioClient.patch(
        'users',
        data: {
          "id": userId,
          "first_name": firstName,
          "last_name": lastName,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateProfilePic(String userId) async {
    try {
      final Response response = await dioClient.patch(
        'user_address/$userId',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
