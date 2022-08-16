import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/landing/presentation/landing_screen.dart';
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
        scaffoldBackgroundColor: bgColor,
      ),
      defaultTransition: Transition.noTransition,
      home: MainScreen(),
    );
  }
}
