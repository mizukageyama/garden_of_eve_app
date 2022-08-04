import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_controllers/bottom_nav_bar_controller.dart';
import 'package:garden_of_eve/common_widgets/bottom_nav_bar.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_screen.dart';
import 'package:garden_of_eve/features/favorites/favorites_screen.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/order_list_screen.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_screen.dart';
import 'package:garden_of_eve/features/products/presentation/product_list/product_list_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);
  final bottomNavController = Get.put(BottomNavBarController());

  final pages = [
    ProductsScreen(),
    const FavoritesScreen(),
    const ProductListScreen(),
    const CartItemScreen(),
    const OrderListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffecf3e3),
        body: Obx(() => pages[bottomNavController.activeIndex.value]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff4dbd90),
          onPressed: () {
            Get.to(() => const ProductListScreen());
          },
          child: const Icon(
            Icons.spa_rounded,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
