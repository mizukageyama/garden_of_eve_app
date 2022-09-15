import 'package:garden_of_eve/features/authentication/data/auth_repository.dart';
import 'package:garden_of_eve/features/authentication/domain/user_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class AuthController extends GetxController {
  final Rxn<User?> currentUser = Rxn<User>();
  final _authRepo = AuthRepository();
  final RxString token = ''.obs;

  Future<bool> loginUser(String email, String password) async {
    Map<String, dynamic> data = await _authRepo.loginUser(email, password);
    bool success = data['success'] == 1;
    if (success) {
      currentUser.value = User.fromJson(data['data']);
      token.value = data['token'];
      print(currentUser.value);
      print(token.value);
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
