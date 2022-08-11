import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/custom_appbar.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/widgets/cart_list_view.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CartItemScreen extends StatelessWidget {
  CartItemScreen({Key? key}) : super(key: key);
  final cartListController = Get.put(CartListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'My Cart',
                style: quicksandBold.copyWith(
                  color: greyColor,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Obx(
                () => _showCartItems(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showCartItems() {
    if (cartListController.isLoadingProd.value) {
      return const SizedBox(
        height: 85,
        child: Center(
          child: Text(
            'Loading...',
          ),
        ),
      );
    }
    if (cartListController.cartList.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }

    return CartListView();
  }
}
