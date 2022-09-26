import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
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
              const Center(
                child: Icon(
                  Icons.spa_rounded,
                  size: 70,
                  color: greenColor,
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
                'FreePik',
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: darkGreyColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Pinterest',
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: darkGreyColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Icons8',
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: darkGreyColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Lottie',
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
