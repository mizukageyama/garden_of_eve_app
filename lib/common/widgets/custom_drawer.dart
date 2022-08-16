import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_items.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildDrawerItems(),
        ],
      ),
    );
  }

  Widget buildDrawerItems() => Column(
        children: drawerItems
            .map((item) => ListTile(
                  leading: Icon(item.icon),
                  title: Text(item.title),
                ))
            .toList(),
      );
}
