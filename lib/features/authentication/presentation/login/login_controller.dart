import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/auth_controller.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/main_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class LoginController extends GetxController {
  final AuthController _authController = Get.find();

  //form
  final loginForm = GlobalKey<FormState>();

  //inputs
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> loginUser() async {
    if (loginForm.currentState!.validate()) {
      bool success = await _authController.loginUser(email.text, password.text);
      if (success) {
        clearInputs();
        Get.off(() => MainScreen());
      } else {
        Get.snackbar(
          'Login Failed',
          'Please check your credentials',
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 20,
          margin: const EdgeInsets.all(15),
          colorText: oxfordBlueColor,
          duration: const Duration(seconds: 4),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    }
  }

  void clearInputs() {
    email.clear();
    password.clear();
  }
}
