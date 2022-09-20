import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static const storage = FlutterSecureStorage();

  static Future<bool> isLoggedIn() async {
    return await storage.read(key: 'isLoggedIn') == '1';
  }
}
