import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/main_controller.dart';
import 'package:garden_of_eve/common/widgets/custom_drawer.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/features/landing/presentation/landing_controller.dart';
import 'package:garden_of_eve/features/landing/presentation/landing_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final _main = Get.put(MainController());
  final landingController = Get.put(LandingPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkestGreenColor,
        body: Stack(
          children: [
            CustomDrawer(),
            Obx(
              () => AnimatedContainer(
                transform: Matrix4.translationValues(
                  _main.xOffset.value,
                  _main.yOffset.value,
                  0,
                )..scale(_main.scaleFactor.value),
                duration: const Duration(
                  milliseconds: 250,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () => _main.closeDrawer(),
                  child: IgnorePointer(
                    ignoring: _main.clickableLanding.value,
                    child: LandingScreen(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
