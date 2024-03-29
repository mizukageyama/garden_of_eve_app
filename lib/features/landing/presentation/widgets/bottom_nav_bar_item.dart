import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/features/landing/presentation/landing_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class BottomNavItem extends StatelessWidget {
  BottomNavItem(
      {Key? key,
      required this.activeIcon,
      required this.inactiveIcon,
      required this.index,
      this.size = 26})
      : super(key: key);

  final LandingPageController landingController = Get.find();
  final IconData activeIcon;
  final IconData inactiveIcon;
  final int index;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Obx(
        () => Icon(
          landingController.isActive(index) ? activeIcon : inactiveIcon,
          color: landingController.isActive(index)
              ? activeGreenColor
              : inactiveGreyColor,
          size: size,
        ),
      ),
      onPressed: () {
        landingController.changeIndex(index);
      },
    );
  }
}
