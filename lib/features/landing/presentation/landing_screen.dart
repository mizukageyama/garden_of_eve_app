import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/user_data_controller.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/features/landing/presentation/landing_controller.dart';
import 'package:garden_of_eve/features/landing/presentation/widgets/bottom_nav_bar.dart';
import 'package:garden_of_eve/features/products/presentation/add_product/add_product_screen.dart';
import 'package:garden_of_eve/features/products/presentation/product_list/product_list_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({
    Key? key,
  }) : super(key: key);

  final LandingPageController landingController = Get.find();
  final UserData _userData = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: PageStorage(
          bucket: landingController.bucket,
          child: Obx(
            () => landingController.currentPage,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_userData.isCurrentUserAdmin) {
              Get.to(() => AddProductScreen());
            } else {
              Get.to(() => ProductListScreen());
            }
          },
          child: GradientContainer(
            height: 60,
            width: 60,
            shape: BoxShape.circle,
            child: _userData.isCurrentUserAdmin
                ? const Icon(
                    Icons.add,
                    size: 26,
                    color: whiteColor,
                  )
                : const Icon(
                    Icons.spa_rounded,
                    color: whiteColor,
                  ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
