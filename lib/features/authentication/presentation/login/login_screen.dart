import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/auth_controller.dart';
import 'package:garden_of_eve/common/services/validator.dart';
import 'package:garden_of_eve/common/widgets/custom_text_field.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/authentication/presentation/login/login_controller.dart';
import 'package:garden_of_eve/features/authentication/presentation/signup/signup_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _authController = Get.put(AuthController(), permanent: true);
  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: context.height -
                context.mediaQueryPadding.top -
                context.mediaQueryPadding.bottom,
            color: greenColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35, 20, 35, 60),
                    child: Form(
                      key: _loginController.loginForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Login to your account',
                            style: quicksandBold.copyWith(
                              color: darkGreyColor,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          CustomTextField(
                            controller: _loginController.email,
                            borderRadius: BorderRadius.circular(5),
                            floatLabel: true,
                            labelText: 'Email',
                            validator: Validator().email,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomTextField(
                            controller: _loginController.password,
                            obscureText: true,
                            borderRadius: BorderRadius.circular(5),
                            floatLabel: true,
                            labelText: 'Password',
                            validator: Validator().notEmpty,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Remember me',
                                style: quicksandMedium.copyWith(
                                  color: darkGreyColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Forgot password?',
                                style: quicksandMedium.copyWith(
                                  color: Colors.blue,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              _loginController.loginUser();
                            },
                            child: GradientContainer(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(20),
                              child: Text(
                                'Login',
                                style: quicksandSemiBold.copyWith(
                                  color: whiteColor,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: neutralGreyColor,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'or use your Google Account',
                                  style: quicksandMedium.copyWith(
                                    color: neutralGreyColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: neutralGreyColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              print('Coming soon..');
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: neutralGreyColor,
                                  width: 0.5,
                                ),
                              ),
                              child: Image.asset(
                                'assets/icons/google_logo.png',
                                height: 18,
                                width: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: quicksandMedium.copyWith(
                                  color: darkGreyColor,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () => Get.off(() => SignupScreen()),
                                child: Text(
                                  'Register here',
                                  style: quicksandMedium.copyWith(
                                    color: Colors.blue,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
