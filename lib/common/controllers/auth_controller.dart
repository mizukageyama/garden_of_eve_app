import 'package:garden_of_eve/common/controllers/user_data_controller.dart';
import 'package:garden_of_eve/features/authentication/data/auth_repository.dart';
import 'package:garden_of_eve/features/authentication/domain/user_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class AuthController extends GetxController {
  final _authRepo = AuthRepository();
  final UserData _userData = Get.find();

  Future<bool> loginUser(String email, String password) async {
    Map<String, dynamic> data = await _authRepo.loginUser(email, password);
    bool success = data['success'] == 1;
    if (success) {
      _userData.currentUser = User.fromJson(data['data']);
      _userData.accessToken = data['token'];
      _userData.storage.write(
        key: 'refreshToken',
        value: data['refreshToken'],
      );
      return true;
    }
    return false;
  }

  Future<bool> registerUser(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    Map<String, dynamic> data = await _authRepo.registerUser(
      firstName,
      lastName,
      email,
      password,
    );
    return data['success'] == 1;
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    //change password
  }

  Future<void> signOut() async {
    //signout
  }
}
