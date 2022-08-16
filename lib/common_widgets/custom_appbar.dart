import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.hasBackButton = false,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: bgColor,
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          hasBackButton
              ? InkWell(
                  splashColor: Colors.transparent,
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 24,
                    color: oxfordBlueColor,
                  ),
                )
              : InkWell(
                  splashColor: Colors.transparent,
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Image.asset(
                    'assets/icons/menu.png',
                    height: 24,
                    width: 24,
                  ),
                ),
          title == null
              ? const SizedBox(
                  height: 0,
                  width: 0,
                )
              : Text(
                  title!,
                  style: quicksandSemiBold.copyWith(
                    color: oxfordBlueColor,
                    fontSize: 17,
                  ),
                ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...?rightWidget,
            ],
          ),
        ],
      ),
    );
  }
}
