import 'dart:convert';
import 'package:garden_of_eve/common/controllers/user_data_controller.dart';
import 'package:garden_of_eve/features/authentication/data/auth_repository.dart';
import 'package:garden_of_eve/features/authentication/presentation/login/login_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class AuthController extends GetxController {
  final _authRepo = AuthRepository();
  final UserData _userData = Get.find();

  Future<bool> loginUser(String email, String password) async {
    Map<String, dynamic> data = await _authRepo.loginUser(email, password);
    bool success = data['success'] == 1;
    if (success) {
      _userData.storage.write(
        key: 'currentUser',
        value: json.encode(data['data']),
      );
      _userData.storage.write(
        key: 'refreshToken',
        value: data['refreshToken'],
      );
      _userData.storage.write(
        key: 'accessToken',
        value: data['token'],
      );
      _userData.storage.write(key: 'isLoggedIn', value: '1');
      await _userData.initializeCurrentUser();
      await _userData.initializeToken();
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

  Future<Map<String, dynamic>> changePassword(
      String oldPassword, String newPassword) async {
    Map<String, dynamic> data = await _authRepo.changePassword(
      _userData.currentUserId,
      oldPassword,
      newPassword,
    );
    return data;
  }

  Future<void> signOut() async {
    await _userData.storage.deleteAll();
    Get.offAll(() => LoginScreen());
  }
}
