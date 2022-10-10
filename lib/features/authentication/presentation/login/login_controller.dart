import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/auth_controller.dart';
import 'package:garden_of_eve/main_screen.dart';
import 'package:garden_of_eve/utils/dialogs.dart';
import 'package:garden_of_eve/utils/utils.dart';

class LoginController extends GetxController {
  final AuthController _authController = Get.find();

  //form
  final loginForm = GlobalKey<FormState>();
  final RxBool _isObscure = true.obs;

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> loginUser() async {
    showLoading();
    if (loginForm.currentState!.validate()) {
      bool success = await _authController.loginUser(email.text, password.text);
      if (success) {
        dismissDialog();
        clearInputs();
        Get.off(() => MainScreen());
      } else {
        dismissDialog();
        showSnackBar(
          title: 'Login Failed',
          message: 'Please check your credentials',
        );
      }
    }
  }

  void clearInputs() {
    email.clear();
    password.clear();
  }

  bool get isObscurePass => _isObscure.value;

  void toggleIsObsure() => _isObscure.value = !_isObscure.value;
}
