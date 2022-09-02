import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          hasBackButton: true,
          backgroundColor: lightGreenColor,
          contentColor: whiteColor,
          title: 'Settings',
        ),
        body: const Center(
          child: Text('Settings'),
        ),
      ),
    );
  }
}
