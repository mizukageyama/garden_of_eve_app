import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/services/validator.dart';
import 'package:garden_of_eve/common/widgets/custom_text_field.dart';
import 'package:garden_of_eve/common/widgets/dialog_button.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/features/profile/presentation/user_info/user_info_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ChangePassDialog extends StatelessWidget {
  ChangePassDialog({Key? key}) : super(key: key);

  final UserInfoController _info = Get.find();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _info.changePassFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Obx(
              () => CustomTextField(
                controller: _info.oldPw,
                obscureText: _info.isObscureOldPass,
                borderRadius: BorderRadius.circular(5),
                floatLabel: true,
                labelText: 'Old Password',
                validator: Validator().password,
                suffixIcon: IconButton(
                  onPressed: () {
                    _info.toggleIsObsureOld();
                  },
                  icon: Icon(
                    _info.isObscureOldPass
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Obx(
              () => CustomTextField(
                controller: _info.newPw,
                obscureText: _info.isObscureNewPass,
                borderRadius: BorderRadius.circular(5),
                floatLabel: true,
                labelText: 'New Password',
                validator: Validator().password,
                suffixIcon: IconButton(
                  onPressed: () {
                    _info.toggleIsObsureNew();
                  },
                  icon: Icon(
                    _info.isObscureNewPass
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
