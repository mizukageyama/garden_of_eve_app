import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_controllers/bottom_nav_bar_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);
  final BottomNavBarController bottomNavController = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //TO DO: SET COLORS
            Expanded(
              child: IconButton(
                icon: Obx(
                  () => Icon(
                    bottomNavController.isActive(0)
                        ? Icons.home_rounded
                        : Icons.home_outlined,
                    color: bottomNavController.isActive(0)
                        ? const Color(0xff4dbd90)
                        : const Color(0xffaeb7c3),
                    size: 26,
                  ),
                ),
                onPressed: () {
                  bottomNavController.changeIndex(0);
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Obx(
                  () => Icon(
                    bottomNavController.isActive(1)
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_outlined,
                    color: bottomNavController.isActive(1)
                        ? const Color(0xff4dbd90)
                        : const Color(0xffaeb7c3),
                    size: 26,
                  ),
                ),
                onPressed: () {
                  bottomNavController.changeIndex(1);
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
                    bottomNavController.isActive(2)
                        ? Icons.shopping_cart_rounded
                        : Icons.shopping_cart_outlined,
                    color: bottomNavController.isActive(2)
                        ? const Color(0xff4dbd90)
                        : const Color(0xffaeb7c3),
                    size: 26,
                  ),
                ),
                onPressed: () {
                  bottomNavController.changeIndex(2);
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Obx(
                  () => Icon(
                    bottomNavController.isActive(3)
                        ? Icons.receipt_rounded
                        : Icons.receipt_outlined,
                    color: bottomNavController.isActive(3)
                        ? const Color(0xff4dbd90)
                        : const Color(0xffaeb7c3),
                    size: 26,
                  ),
                ),
                onPressed: () {
                  bottomNavController.changeIndex(3);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
