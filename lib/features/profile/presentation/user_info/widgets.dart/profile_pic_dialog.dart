import 'dart:io';
import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class ProfilePicDialog extends StatelessWidget {
  const ProfilePicDialog({
    Key? key,
    required this.path,
  }) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            File(path),
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
    );
  }
}
