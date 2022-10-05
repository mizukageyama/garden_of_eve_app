import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/dialog_button.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:get/get.dart';

void showLoading() {
  Get.defaultDialog(
    title: 'Loading...',
    content: const CircularProgressIndicator(),
    barrierDismissible: false,
  );
}

void showSimpleErrorDialog({
  required String errorTitle,
  required String errorDescription,
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
            buttonText: 'Okay',
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
        //width: kIsWeb ? 400 : Get.width * .9,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        margin: const EdgeInsets.only(top: 13),
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
