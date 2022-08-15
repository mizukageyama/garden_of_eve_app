import 'package:flutter/material.dart';
import 'package:garden_of_eve/utils/utils.dart';

class MyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  final List<Tab> tabs = const [
    Tab(text: 'To Ship'),
    Tab(text: 'To Receive'),
    Tab(text: 'Cancelled'),
    Tab(text: 'Completed'),
  ];

  @override
  void onInit() {
    controller = TabController(vsync: this, length: tabs.length);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
