import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/services/validator.dart';
import 'package:garden_of_eve/common/widgets/custom_text_field.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/authentication/presentation/login/login_screen.dart';
import 'package:garden_of_eve/features/authentication/presentation/signup/signup_controller.dart';
import 'package:garden_of_eve/utils/dialogs.dart';
import 'package:garden_of_eve/utils/utils.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final _signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GradientContainer(
            height: context.height -
                context.mediaQueryPadding.top -
                context.mediaQueryPadding.bottom,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Garden of Eve',
                      style: quicksandBold.copyWith(
                        color: whiteColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
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
                      key: _signupController.signupForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Create New Account',
                            style: quicksandBold.copyWith(
                              color: darkGreyColor,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: _signupController.firstName,
                                  borderRadius: BorderRadius.circular(5),
                                  floatLabel: true,
                                  labelText: 'First Name',
                                  validator: Validator().notEmpty,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomTextField(
                                  controller: _signupController.lastName,
                                  borderRadius: BorderRadius.circular(5),
                                  floatLabel: true,
                                  labelText: 'Last Name',
                                  validator: Validator().notEmpty,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomTextField(
                            controller: _signupController.email,
                            borderRadius: BorderRadius.circular(5),
                            floatLabel: true,
                            labelText: 'Email',
                            validator: Validator().email,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Obx(
                            () => CustomTextField(
                              controller: _signupController.password,
                              obscureText: _signupController.isObscurePw,
                              borderRadius: BorderRadius.circular(5),
                              floatLabel: true,
                              labelText: 'Password',
                              validator: Validator().password,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _signupController.toggleIsObsurePw();
                                },
                                icon: Icon(
                                  _signupController.isObscurePw
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              _signupController.signupUser();
                            },
                            child: GradientContainer(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(20),
                              child: Text(
                                'Register',
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
                          GestureDetector(
                            onTap: () {
                              showCustomDialog(
                                title: 'Coming Soon...',
                                description:
                                    'Sign up with Google is still not available. Thank you!',
                                iconWidget: Image.asset(
                                  'assets/icons/google_logo.png',
                                  height: 40,
                                  width: 40,
                                ),
                              );
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
                                'Already have an account?',
                                style: quicksandMedium.copyWith(
                                  color: darkGreyColor,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () => Get.off(() => LoginScreen()),
                                child: Text(
                                  'Login here',
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
