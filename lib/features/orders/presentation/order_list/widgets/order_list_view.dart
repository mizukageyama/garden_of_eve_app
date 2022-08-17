import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/order_list_controller.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/widgets/order_tile.dart';
import 'package:garden_of_eve/utils/utils.dart';

class OrderListView extends StatelessWidget {
  OrderListView({Key? key}) : super(key: key);
  final OrderListController orderListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey<String>('pageOne'),
      controller: orderListController.orderScroller,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      itemCount: orderListController.orders.length + 1,
      itemBuilder: (context, index) {
        if (index == orderListController.orders.length) {
          return Visibility(
            visible: orderListController.hasMoreData,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: InkWell(
            onTap: () {
              orderListController.orders.removeAt(index);
            },
            child: OrderTile(
              order: orderListController.orders[index],
            ),
          ),
        );
      },
    );
  }
}
