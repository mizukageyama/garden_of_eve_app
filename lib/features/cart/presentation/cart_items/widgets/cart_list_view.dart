import 'package:flutter/cupertino.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/widgets/cart_tile.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CartListView extends StatelessWidget {
  CartListView({Key? key}) : super(key: key);
  final CartListController cartListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        key: const PageStorageKey<String>('pageOne'),
        controller: cartListController.cartListScroller,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        itemCount: cartListController.cartList.length + 1,
        itemBuilder: (context, index) {
          if (index == cartListController.cartList.length) {
            return Visibility(
              visible: cartListController.productHasMoreData,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CartTile(
              cartItem: cartListController.cartList[index],
            ),
          );
        },
      ),
    );
  }
}
