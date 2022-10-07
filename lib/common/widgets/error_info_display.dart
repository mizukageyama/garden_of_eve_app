import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class ErrorInfoDisplay extends StatelessWidget {
  const ErrorInfoDisplay({
    Key? key,
    required this.message,
    this.isWhiteBackground = true,
  }) : super(key: key);

  final String message;
  final bool isWhiteBackground;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          color: isWhiteBackground
              ? whiteColor
              : neutralGreyColor.withOpacity(
                  0.1,
                ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.info_outlined,
                color: greenColor,
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: Text(
                  message,
                  style: quicksandMedium.copyWith(
                    color: isWhiteBackground ? neutralGreyColor : darkGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
