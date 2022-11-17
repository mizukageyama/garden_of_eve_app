import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/main_controller.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.hasBackButton = false,
    this.backgroundColor = bgColor,
    this.contentColor = oxfordBlueColor,
    this.height,
    this.rightWidget,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);
  final bool hasBackButton;
  final List<Widget>? rightWidget;
  final double? height;
  final String? title;
  final Color backgroundColor;
  final Color contentColor;
  // final MainController _main = Get.put(MainController());
  final MainController _main = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: backgroundColor,
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
              height: 24,
              child: Align(
                alignment: Alignment.centerLeft,
                child: hasBackButton
                    ? GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 24,
                          color: contentColor,
                        ),
                      )
                    : GestureDetector(
                        onTap: () => _main.openDrawer(),
                        child: Image.asset(
                          'assets/icons/menu.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
              ),
            ),
          ),
          Expanded(
            child: Visibility(
              visible: title != null,
              child: Text(
                '$title',
                style: quicksandSemiBold.copyWith(
                  color: contentColor,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ...?rightWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
