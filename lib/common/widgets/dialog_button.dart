import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    Key? key,
    required this.buttonText,
    this.isCancel = false,
    this.onTap,
  }) : super(key: key);

  final String? buttonText;
  final Function()? onTap;
  final bool isCancel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: isCancel ? whiteColor : lightGreenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(
            color: lightGreenColor,
            width: 2.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          buttonText!,
          style: quicksandBold.copyWith(
            fontSize: 14,
            color: isCancel ? lightGreenColor : whiteColor,
          ),
        ),
      ),
    );
  }
}
