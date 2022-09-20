import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/auth_controller.dart';
import 'package:garden_of_eve/common/controllers/user_data_controller.dart';
import 'package:garden_of_eve/common/services/secure_storage.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/constants/app_pages.dart';
import 'package:garden_of_eve/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await StorageService.isLoggedIn();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);

  final bool isLoggedIn;

  final UserData user = Get.put(UserData());
  final AuthController auth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Garden of Eve',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          backgroundColor: lightGreenColor,
        ),
        splashFactory: NoSplash.splashFactory,
        scaffoldBackgroundColor: bgColor,
      ),
      defaultTransition: Transition.noTransition,
      initialRoute: isLoggedIn ? '/main' : '/login',
      getPages: AppPages.routes,
      unknownRoute: AppPages.errorRoute,
    );
  }
}
