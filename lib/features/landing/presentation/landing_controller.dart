import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/app_info/app_info_screen.dart';
import 'package:garden_of_eve/features/favorites/presentation/favorites/favorites_screen.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_screen.dart';
import 'package:garden_of_eve/features/profile/presentation/profile/profile_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class LandingPageController extends GetxController {
  RxInt activeIndex = 0.obs;
  final PageStorageBucket bucket = PageStorageBucket();

  final pages = [
    ProductsScreen(
      key: const PageStorageKey<String>('pageOne'),
    ),
    FavoritesScreen(
      key: const PageStorageKey<String>('pageTwo'),
    ),
    const ProfileScreen(
      key: PageStorageKey<String>('pageThree'),
    ),
    const AppInfoScreen(
      key: PageStorageKey<String>('pageFour'),
    )
  ];

  void changeIndex(int newIndex) => activeIndex.value = newIndex;

  bool isActive(int index) => index == activeIndex.value;

  StatelessWidget get currentPage => pages[activeIndex.value];

  int get selectedIndex => activeIndex.value;
}
