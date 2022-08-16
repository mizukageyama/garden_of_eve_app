import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_items.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GradientContainer(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(55),
            topRight: Radius.circular(130),
          ),
          padding: const EdgeInsets.fromLTRB(15, 50, 30, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: bgColor,
                    width: 2,
                  ),
                  color: darkestGreenColor,
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/profile.jpg',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Dakota Johnson',
                  style: quicksandBold.copyWith(
                    color: darkestGreenColor,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Flexible(
          child: SingleChildScrollView(
            child: buildDrawerItems(),
          ),
        ),
      ],
    );
  }

  Widget buildDrawerItems() => Column(
        children: drawerItems
            .map(
              (item) => ListTile(
                onTap: () {
                  print('clicked: ${item.title}');
                },
                leading: Icon(
                  item.icon,
                  color: whiteColor,
                  size: 20,
                ),
                title: Text(
                  item.title,
                  style: quicksandSemiBold.copyWith(
                    color: whiteColor,
                    fontSize: 16,
                  ),
                ),
              ),
            )
            .toList(),
      );
}
