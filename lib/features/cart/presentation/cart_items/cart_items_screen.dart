import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/widgets/cart_list_view.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/widgets/checkout_bottom_bar.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CartItemScreen extends StatelessWidget {
  CartItemScreen({Key? key}) : super(key: key);
  final CartListController cartListController = Get.find();
  RxBool selectAll = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          hasBackButton: true,
          title: 'My Cart',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Checkbox(
                      side: const BorderSide(
                        color: greyColor,
                      ),
                      checkColor: whiteColor,
                      activeColor: greenColor,
                      value: selectAll.value,
                      onChanged: (value) {
                        selectAll.value = value!;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  Text(
                    "Select All",
                    style: quicksandSemiBold.copyWith(
                      fontSize: 14,
                      color: oxfordBlueColor,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Obx(
                () => _showCartItems(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CheckoutBottomBar(),
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

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 465,
        minHeight: 0,
      ),
      child: CartListView(),
    );
  }
}
