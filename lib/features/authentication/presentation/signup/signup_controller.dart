import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/auth_controller.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/authentication/presentation/login/login_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class SignupController extends GetxController {
  final AuthController _authController = Get.find();

  //form
  final signupForm = GlobalKey<FormState>();

  //inputs
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> signupUser() async {
    if (signupForm.currentState!.validate()) {
      bool success = await _authController.registerUser(
        firstName.text,
        lastName.text,
        email.text,
        password.text,
      );
      Get.snackbar(
        success ? 'Registered' : 'Register Failed',
        success ? 'You may now login your account' : 'Please try again later',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: oxfordBlueColor,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      if (success) {
        clearInputs();
        Get.off(() => LoginScreen());
      }
    }
  }

  void clearInputs() {
    firstName.clear();
    lastName.clear();
    email.clear();
    password.clear();
  }
}
