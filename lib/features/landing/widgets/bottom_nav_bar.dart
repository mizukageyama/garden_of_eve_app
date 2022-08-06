import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/features/landing/presentation/landing_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);
  final LandingPageController landingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: whiteColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: Obx(
                  () => Icon(
                    landingController.isActive(0)
                        ? Icons.home_rounded
                        : Icons.home_outlined,
                    color: landingController.isActive(0)
                        ? activeGreenColor
                        : inactiveGreyColor,
                    size: 26,
                  ),
                ),
                onPressed: () {
                  landingController.changeIndex(0);
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Obx(
                  () => Icon(
                    landingController.isActive(1)
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_outlined,
                    color: landingController.isActive(1)
                        ? activeGreenColor
                        : inactiveGreyColor,
                    size: 26,
                  ),
                ),
                onPressed: () {
                  landingController.changeIndex(1);
                },
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: IconButton(
                icon: Obx(
                  () => Icon(
                    landingController.isActive(2)
                        ? Icons.shopping_cart_rounded
                        : Icons.shopping_cart_outlined,
                    color: landingController.isActive(2)
                        ? activeGreenColor
                        : inactiveGreyColor,
                    size: 26,
                  ),
                ),
                onPressed: () {
                  landingController.changeIndex(2);
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Obx(
                  () => Icon(
                    landingController.isActive(3)
                        ? Icons.receipt_rounded
                        : Icons.receipt_outlined,
                    color: landingController.isActive(3)
                        ? activeGreenColor
                        : inactiveGreyColor,
                    size: 26,
                  ),
                ),
                onPressed: () {
                  landingController.changeIndex(3);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
