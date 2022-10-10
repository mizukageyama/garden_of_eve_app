import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/auth_controller.dart';
import 'package:garden_of_eve/common/controllers/user_data_controller.dart';
import 'package:garden_of_eve/features/profile/data/user_repository.dart';
import 'package:garden_of_eve/features/profile/presentation/user_info/widgets.dart/profile_pic_dialog.dart';
import 'package:garden_of_eve/utils/dialogs.dart';
import 'package:garden_of_eve/utils/utils.dart';

class UserInfoController extends GetxController {
  final _userRepo = UserRepository();

  final UserData _userData = Get.find();
  final AuthController _auth = Get.find();

  final RxBool isEditable = false.obs;

  final ImagePicker _picker = ImagePicker();
  final Rxn<XFile?> image = Rxn<XFile?>();

  final editFormKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final changePassFormKey = GlobalKey<FormState>();
  final oldPw = TextEditingController();
  final newPw = TextEditingController();
  final RxBool isObscureOldPw = true.obs;
  final RxBool isObscureNewPw = true.obs;

  @override
  void onInit() {
    initDisplayedData();
    super.onInit();
  }

  Future<void> changePassword() async {
    if (changePassFormKey.currentState!.validate()) {
      showLoading();
      final Map<String, dynamic> message = await _auth.changePassword(
        oldPw.text,
        newPw.text,
      );
      dismissDialog();
      final bool success = message['success'] == 1;

      if (success) {
        dismissDialog();
        oldPw.clear();
        newPw.clear();
      }
      showSnackBar(
        title: 'Change Password ${success ? 'Success' : 'Failed'}',
        message: '${message['message']}',
      );
    }
    return;
  }

  Future<void> initDisplayedData() async {
    firstName.text = _userData.currentUser!.firstName;
    lastName.text = _userData.currentUser!.lastName;
  }

  bool get isEdit => isEditable.value;

  set editable(bool value) => isEditable.value = value;

  bool get isFirstNameChanged =>
      firstName.text != _userData.currentUser?.firstName;

  bool get isLastNameChanged =>
      lastName.text != _userData.currentUser?.lastName;

  Future<void> updateUser() async {
    if (editFormKey.currentState!.validate()) {
      if (isFirstNameChanged || isLastNameChanged) {
        showLoading();

        final message = await _userRepo.updateUser(
          _userData.currentUserId,
          firstName.text,
          lastName.text,
        );

        bool success = message['success'] == 1;
        dismissDialog();

        if (!success) {
          await initDisplayedData();
        } else {
          //reset current user
        }

        showSnackBar(
          title: success ? 'Success' : 'Failed',
          message: message['message'],
          duration: const Duration(seconds: 1),
        );
      }
      editable = false;
    }
    return;
  }

  Future<void> selectImage() async {
    final XFile? selectedImage = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    if (selectedImage == null) return;
    image.value = selectedImage;

    showConfirmationDialog(
      dialogTitle: 'Save this as profile photo?',
      dialogCaption:
          'Please select save to change your profile photo. Otherwise, select cancel',
      confirmText: 'Yes',
      cancelText: 'Cancel',
      onConfirmTap: () {
        //TO DO: API save profile photo
      },
      content: ProfilePicDialog(
        path: selectedImage.path,
      ),
    );
    //show dialog with the selected image
    //and have an option proceed or cancel
  }

  bool get isObscureOldPass => isObscureOldPw.value;

  bool get isObscureNewPass => isObscureNewPw.value;

  void toggleIsObsureOld() => isObscureOldPw.value = !isObscureOldPw.value;

  void toggleIsObsureNew() => isObscureNewPw.value = !isObscureNewPw.value;
}
