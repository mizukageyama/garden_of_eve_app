import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/utils/utils.dart';

class QuantityIncrementor extends StatelessWidget {
  QuantityIncrementor({
    Key? key,
    required this.maxLimit,
    required this.onChange,
    this.initialVal = 1,
    this.style2 = false,
  })  : _count = initialVal.obs,
        super(key: key);

  final RxInt _count;
  final int initialVal;
  final int maxLimit;
  final Function(int) onChange;
  final bool style2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        border: style2
            ? null
            : Border.all(
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
              if (_count.value > 1) {
                _count - (1);
                onChange(_count.value);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: style2 ? Colors.transparent : greenColor,
                shape: style2 ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: style2 ? BorderRadius.circular(8) : null,
                border: style2
                    ? Border.all(
                        color: greenColor,
                      )
                    : null,
              ),
              child: Icon(
                Icons.remove_rounded,
                color: style2 ? greenColor : whiteColor,
                size: style2 ? 14 : 18,
              ),
            ),
          ),
          SizedBox(
            width: 45,
            child: Obx(
              () => Text(
                '${_count.value}',
                textAlign: TextAlign.center,
                style: quicksandBold.copyWith(
                  color: darkGreyColor,
                  fontSize: style2 ? 14 : 18,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (_count.value < maxLimit) {
                _count + (1);
                onChange(_count.value);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: greenColor,
                ),
                color: greenColor,
                shape: style2 ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: style2 ? BorderRadius.circular(8) : null,
              ),
              child: Icon(
                Icons.add_rounded,
                color: whiteColor,
                size: style2 ? 14 : 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
