import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/common/widgets/error_info_display.dart';
import 'package:garden_of_eve/common/widgets/loading_list_view.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/widgets/cart_list_view.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/widgets/cart_tile_skeleton.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/widgets/checkout_bottom_bar.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CartItemScreen extends StatelessWidget {
  CartItemScreen({Key? key}) : super(key: key);
  final CartListController cartListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          hasBackButton: true,
          title: 'My Cart',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Obx(
                () => _showCartItems(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: CheckoutBottomBar(),
        ),
      ),
    );
  }

  Widget _showCartItems() {
    if (cartListController.isLoadingProd.value) {
      return const LoadingListView(
        isHorizontalDirection: false,
        itemCount: 10,
        skeleton: CartTileSkeleton(),
      );
    }
    if (cartListController.cartList.isEmpty) {
      return const ErrorInfoDisplay(
        message: 'No items on cart',
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 465,
        minHeight: 0,
      ),
      child: CartListView(),
    );
  }
}
