import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/dialog_button.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/utils/utils.dart';

void showSnackBar({
  required String title,
  required String message,
  Duration duration = const Duration(seconds: 4),
  bool isDismissable = true,
}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: oxfordBlueColor,
    duration: duration,
    isDismissible: isDismissable,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

void showLoading() {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: whiteColor,
            ),
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Please wait',
                  style: quicksandSemiBold.copyWith(
                    color: neutralGreyColor,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Lottie.asset(
                    'assets/lottie_files/loading-dots-green.json',
                    repeat: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}

void showErrorDialog({
  required String errorTitle,
  required String errorDescription,
  Widget? iconWidget,
}) {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 35, 15, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whiteColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  errorTitle,
                  style: quicksandBold.copyWith(
                    color: darkGreyColor,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  errorDescription,
                  style: quicksandSemiBold.copyWith(
                    color: neutralGreyColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
              ),
              child: iconWidget ??
                  Image.asset(
                    'assets/images/logo.png',
                    height: 40,
                    width: 40,
                  ),
            ),
          ),
        ],
      ),
    ),
    barrierDismissible: true,
  );
}

void showErrorDialogWithButton({
  required String errorTitle,
  required String errorDescription,
  String buttonText = 'Okay',
  void Function()? onTapFunc = dismissDialog,
}) {
  Get.defaultDialog(
    title: errorTitle,
    contentPadding: const EdgeInsets.all(10),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          errorDescription,
          style: quicksandSemiBold.copyWith(
            color: neutralGreyColor,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 130,
          child: DialogButton(
            buttonText: buttonText,
            onTap: onTapFunc,
          ),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}

void showConfirmationDialog({
  required String dialogTitle,
  required String dialogCaption,
  String confirmText = 'Yes',
  String cancelText = 'No',
  required Widget content,
  required void Function() onConfirmTap,
  void Function() onCancelTap = dismissDialog,
}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: Get.back,
              child: const Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Color(0xFFE3E6E8),
                  child: Icon(
                    Icons.close,
                    color: neutralGreyColor,
                    size: 16,
                  ),
                ),
              ),
            ),
            Text(
              dialogTitle,
              style: quicksandBold.copyWith(
                fontSize: 18,
                color: neutralGreyColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              dialogCaption,
              style: quicksandBold.copyWith(
                fontSize: 14,
                color: neutralGreyColor.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            content,
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DialogButton(
                      buttonText: confirmText,
                      onTap: onConfirmTap,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DialogButton(
                      isCancel: true,
                      buttonText: cancelText,
                      onTap: onCancelTap,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

void dismissDialog() {
  Get.back();
}
