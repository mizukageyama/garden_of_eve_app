import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/constants/app_pages.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/checkout_screen.dart';
import 'package:garden_of_eve/features/profile/presentation/profile/profile_screen.dart';
import 'package:garden_of_eve/main_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: MainScreen(),
      //initialRoute: '/',
      getPages: AppPages.routes,
      unknownRoute: AppPages.errorRoute,
    );
  }
}
