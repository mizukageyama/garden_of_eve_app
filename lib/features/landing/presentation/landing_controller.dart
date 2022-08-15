import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_screen.dart';
import 'package:garden_of_eve/features/favorites/presentation/favorites_screen/favorites_screen.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/order_list_screen.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_screen.dart';
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
    CartItemScreen(
      key: const PageStorageKey<String>('pageThree'),
    ),
    OrderListScreen(
      key: const PageStorageKey<String>('pageFour'),
    )
  ];

  void changeIndex(int newIndex) => activeIndex.value = newIndex;

  bool isActive(int index) => index == activeIndex.value;

  get currentPage => pages[activeIndex.value];

  get selectedIndex => activeIndex.value;
}
