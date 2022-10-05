import 'dart:io';

import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/user_data_controller.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/utils/dialogs.dart';
import 'package:garden_of_eve/utils/utils.dart';

class UserInfoController extends GetxController {
  final UserData _userData = Get.find();

  final ImagePicker _picker = ImagePicker();
  final Rxn<XFile?> image = Rxn<XFile?>();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final RxBool isEditable = false.obs;

  @override
  void onInit() {
    firstName.text = _userData.currentUser!.firstName;
    lastName.text = _userData.currentUser!.lastName;
    email.text = _userData.currentUser!.email;
    super.onInit();
  }

  bool get isEdit => isEditable.value;

  set editable(bool value) => isEditable.value = value;

  bool get isFirstNameChanged =>
      firstName.text != _userData.currentUser!.firstName;

  bool get isLastNameChanged =>
      firstName.text != _userData.currentUser!.firstName;

  bool get isEmailChanged => firstName.text != _userData.currentUser!.firstName;

  void updateUser() {
    if (isFirstNameChanged || isLastNameChanged || isEmailChanged) {
      //update info
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
        print('API save new profile');
      },
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: neutralGreyColor.withOpacity(0.2),
            ),
            child: Image.file(
              File(selectedImage.path),
              width: 140,
              height: 140,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    'Could not load image',
                    textAlign: TextAlign.center,
                    style: quicksandMedium.copyWith(
                      color: neutralGreyColor,
                      fontSize: 13.5,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
    //show dialog with the selected image
    //and have an option proceed or cancel
  }
}
