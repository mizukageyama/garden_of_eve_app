import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class Step3Review extends StatelessWidget {
  const Step3Review({Key? key, required this.callback}) : super(key: key);
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Step 3'),
        Text('Review'),
        InkWell(
          onTap: () => callback(),
          child: GradientContainer(
            borderRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
              child: Text(
                'Create Order',
                textAlign: TextAlign.center,
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
