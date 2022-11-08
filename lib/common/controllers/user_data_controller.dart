import 'dart:convert';
import 'package:garden_of_eve/common/services/secure_storage.dart';
import 'package:garden_of_eve/features/authentication/domain/user_model.dart';
import 'package:garden_of_eve/utils/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserData extends GetxController {
  String? _accessToken;
  final Rxn<User?> _currentUser = Rxn<User>();

  @override
  void onInit() {
    initializeCurrentUser();
    initializeToken();
    super.onInit();
  }

  FlutterSecureStorage get storage => StorageService.storage;

  set currentUser(User? user) => _currentUser.value = user;

  User? get currentUser => _currentUser.value;

  int get currentUserId => _currentUser.value?.id ?? 0;

  bool get isCurrentUserAdmin => _currentUser.value?.isAdmin ?? false;

  String get currentUserFullName =>
      '${_currentUser.value?.firstName} ${_currentUser.value?.lastName}';

  set accessToken(String? newToken) => _accessToken = newToken;

  String get accessToken => _accessToken ?? '';

  Future<void> initializeCurrentUser() async {
    String? userJson = await storage.read(key: 'currentUser');
    if (userJson == null) {
      return;
    }
    currentUser = User.fromJson(json.decode(userJson));
  }

  Future<void> initializeToken() async {
    String? token = await storage.read(key: 'accessToken');
    accessToken = token;
  }

  void clearUser() {
    storage.deleteAll();
  }
}
