import 'package:garden_of_eve/features/authentication/data/auth_repository.dart';
import 'package:garden_of_eve/features/authentication/domain/user_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class AuthController extends GetxController {
  // final _storage = const FlutterSecureStorage();
  final Rxn<User?> _currentUser = Rxn<User>();
  final _authRepo = AuthRepository();
  String? _accessToken;

  @override
  void onInit() {
    print('INITIALIZED AUTH');
    super.onInit();
  }

  Future<bool> loginUser(String email, String password) async {
    Map<String, dynamic> data = await _authRepo.loginUser(email, password);
    bool success = data['success'] == 1;
    if (success) {
      _currentUser.value = User.fromJson(data['data']);
      _accessToken = data['token'];
      // _storage.write(
      //   key: 'refreshToken',
      //   value: data['refreshToken'],
      // );
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

  //FlutterSecureStorage get storage => _storage;

  set accessToken(String? newToken) => _accessToken = newToken;

  String get accessToken => _accessToken ?? '';

  int get currentUserId => _currentUser.value?.id ?? 0;

  User get currentUser => _currentUser.value!;
}
