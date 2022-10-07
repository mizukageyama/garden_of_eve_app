import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 70,
                  width: 70,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'About Garden of Eve',
                style: quicksandBold.copyWith(
                  fontSize: 15,
                  color: oxfordBlueColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'The Garden of Eve (since 2022) is a family-owned plant shop in the Philippines. The business started from a simple private garden of Mrs. Evelyn. A lot of visitors offered to buy some of the plants they liked. This led to the start of the business.',
                textAlign: TextAlign.justify,
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: darkGreyColor,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.pin_drop,
                    color: darkGreenColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Davao del Norte, Philippines',
                    textAlign: TextAlign.justify,
                    style: quicksandSemiBold.copyWith(
                      fontSize: 14,
                      color: darkGreyColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: darkGreenColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '216-2162 / 09000009700',
                    textAlign: TextAlign.justify,
                    style: quicksandSemiBold.copyWith(
                      fontSize: 14,
                      color: darkGreyColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'App Developer',
                style: quicksandBold.copyWith(
                  fontSize: 15,
                  color: oxfordBlueColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Emmalyn Nabiamos',
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: darkGreyColor,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Credits',
                style: quicksandBold.copyWith(
                  fontSize: 15,
                  color: oxfordBlueColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'FreePik\nLogo by mudassir101 on Freepik',
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: darkGreyColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Pinterest (some of the UI design)',
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: darkGreyColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Icons8 (some of the icons used)',
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: darkGreyColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Lottie (loading indicator used)',
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: darkGreyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
