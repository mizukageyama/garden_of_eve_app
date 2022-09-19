import 'package:garden_of_eve/features/authentication/domain/user_model.dart';
import 'package:garden_of_eve/utils/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserData extends GetxController {
  final _storage = const FlutterSecureStorage();
  String? _accessToken;
  final Rxn<User?> _currentUser = Rxn<User>();

  set currentUser(User? user) => _currentUser.value = user;

  FlutterSecureStorage get storage => _storage;

  set accessToken(String? newToken) => _accessToken = newToken;

  String get accessToken => _accessToken ?? '';

  int get currentUserId => _currentUser.value?.id ?? 0;

  User? get currentUser => _currentUser.value;
}
