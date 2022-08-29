import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/radio_step_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ExpandableRadioOpt extends StatelessWidget {
  const ExpandableRadioOpt({
    Key? key,
    required this.title,
    required this.content,
    required this.radioValue,
    required this.stepController,
  }) : super(key: key);

  final Widget title;
  final Widget content;
  final int radioValue;
  final RadioStepController stepController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            stepController.togglePanels(radioValue);
          },
          child: Row(
            children: [
              Obx(
                () => Radio(
                  value: radioValue,
                  groupValue: stepController.activeIndex,
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  activeColor: greenColor,
                  onChanged: (value) {
                    stepController.togglePanels(radioValue);
                  },
                ),
              ),
              title,
            ],
          ),
        ),
        ExpandableNotifier(
          controller: stepController.options[radioValue - 1],
          child: Expandable(
            collapsed: const SizedBox(
              height: 0,
              width: 0,
            ),
            expanded: content,
          ),
        ),
      ],
    );
  }
}
