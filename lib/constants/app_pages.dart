import 'package:garden_of_eve/features/authentication/presentation/login/login_screen.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_screen.dart';
import 'package:garden_of_eve/features/error_page/error_screen.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/order_list_screen.dart';
import 'package:garden_of_eve/features/profile/presentation/profile/profile_screen.dart';
import 'package:garden_of_eve/features/profile/presentation/settings/settings_screen.dart';
import 'package:garden_of_eve/main_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/main',
      page: () => MainScreen(),
    ),
    GetPage(
      name: '/cart',
      page: () => CartItemScreen(),
    ),
    GetPage(
      name: '/orders',
      page: () => OrderListScreen(),
    ),
    GetPage(
      name: '/settings',
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: '/profile',
      page: () => ProfileScreen(),
    ),
  ];

  static final errorRoute = GetPage(
    name: '/error-route',
    page: () => const ErrorScreen(),
  );
}
