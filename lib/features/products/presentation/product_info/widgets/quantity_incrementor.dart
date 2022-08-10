import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/utils/utils.dart';

class QuantityIncrementor extends StatelessWidget {
  QuantityIncrementor({
    Key? key,
    required this.maxLimit,
    required this.onChange,
  }) : super(key: key);

  final RxInt count = 1.obs;
  final int maxLimit;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(
          color: neutralGreyColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if (count.value > 1) {
                count.value -= 1;
                onChange(count.value);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: greenColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.remove_rounded,
                color: whiteColor,
                size: 18,
              ),
            ),
          ),
          SizedBox(
            width: 45,
            child: Obx(
              () => Text(
                '${count.value}',
                textAlign: TextAlign.center,
                style: quicksandBold.copyWith(
                  color: darkGreyColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (count.value < maxLimit) {
                count.value += 1;
                onChange(count.value);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: greenColor,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.add_rounded,
                  color: whiteColor,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
