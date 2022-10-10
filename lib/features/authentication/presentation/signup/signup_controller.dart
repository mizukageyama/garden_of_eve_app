import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/auth_controller.dart';
import 'package:garden_of_eve/features/authentication/presentation/login/login_screen.dart';
import 'package:garden_of_eve/utils/dialogs.dart';
import 'package:garden_of_eve/utils/utils.dart';

class SignupController extends GetxController {
  final AuthController _authController = Get.find();

  //form
  final signupForm = GlobalKey<FormState>();
  final RxBool _isObscure = true.obs;

  //inputs
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> signupUser() async {
    showLoading();
    if (signupForm.currentState!.validate()) {
      bool success = await _authController.registerUser(
        firstName.text,
        lastName.text,
        email.text,
        password.text,
      );
      dismissDialog();
      showSnackBar(
        title: success ? 'Registered' : 'Register Failed',
        message: success
            ? 'You may now login your account'
            : 'Please try again later',
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

  bool get isObscurePw => _isObscure.value;

  void toggleIsObsurePw() => _isObscure.value = !_isObscure.value;
}
