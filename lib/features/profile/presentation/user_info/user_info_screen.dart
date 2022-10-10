import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/services/validator.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/common/widgets/custom_text_field.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/features/profile/presentation/user_info/user_info_controller.dart';
import 'package:garden_of_eve/features/profile/presentation/user_info/widgets.dart/change_pass_dialog.dart';
import 'package:garden_of_eve/utils/dialogs.dart';
import 'package:garden_of_eve/utils/utils.dart';

class UserInfoScreen extends StatelessWidget {
  UserInfoScreen({Key? key}) : super(key: key);
  final _info = Get.put(UserInfoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: CustomAppBar(
          hasBackButton: true,
          backgroundColor: lightGreenColor,
          title: 'Personal Info',
          contentColor: whiteColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 25,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              clipBehavior: Clip.hardEdge,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/profile.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Visibility(
                                    visible: _info.isEdit,
                                    child: Positioned(
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: () async {
                                            await _info.selectImage();
                                          },
                                          child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              color: greyColor.withOpacity(
                                                0.55,
                                              ),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3),
                                            child: const Center(
                                              child: Icon(
                                                Icons
                                                    .add_photo_alternate_rounded,
                                                color: whiteColor,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Obx(
                                () => _info.isEdit
                                    ? GestureDetector(
                                        onTap: () async {
                                          await _info.updateUser();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 3.5,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: lightGreenColor,
                                          ),
                                          child: Text(
                                            'Save',
                                            style: quicksandSemiBold.copyWith(
                                              color: whiteColor,
                                            ),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          _info.editable = true;
                                        },
                                        child: const Icon(
                                          Icons.edit,
                                          color: lightGreenColor,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Form(
                        key: _info.editFormKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(
                              () => CustomTextField(
                                enabled: _info.isEdit,
                                controller: _info.firstName,
                                borderRadius: BorderRadius.circular(5),
                                floatLabel: true,
                                labelText: 'First Name',
                                validator: Validator().notEmpty,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Obx(
                              () => CustomTextField(
                                enabled: _info.isEdit,
                                controller: _info.lastName,
                                borderRadius: BorderRadius.circular(5),
                                floatLabel: true,
                                labelText: 'Last Name',
                                validator: Validator().notEmpty,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    showConfirmationDialog(
                      dialogTitle: 'Change Password',
                      dialogCaption:
                          'Please provide your current password and your new password.',
                      confirmText: 'Proceed',
                      cancelText: 'Cancel',
                      content: ChangePassDialog(),
                      onConfirmTap: () async {
                        await _info.changePassword();
                      },
                    );
                  },
                  child: GradientContainer(
                    borderRadius: BorderRadius.circular(10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Change Password',
                          style: quicksandSemiBold.copyWith(
                            color: whiteColor,
                          ),
                        ),
                      ],
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
