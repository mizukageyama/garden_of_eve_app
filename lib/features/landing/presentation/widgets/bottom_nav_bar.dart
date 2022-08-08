import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/features/landing/presentation/widgets/bottom_nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

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
              child: BottomNavItem(
                activeIcon: Icons.home_rounded,
                inactiveIcon: Icons.home_outlined,
                index: 0,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                activeIcon: Icons.favorite_rounded,
                inactiveIcon: Icons.favorite_border_outlined,
                index: 1,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: BottomNavItem(
                activeIcon: Icons.shopping_cart_rounded,
                inactiveIcon: Icons.shopping_cart_outlined,
                index: 2,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                activeIcon: Icons.receipt_rounded,
                inactiveIcon: Icons.receipt_outlined,
                index: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
