import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/error_info_display.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/common/widgets/loading_list_view.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/order_list_controller.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/widgets/order_list_view.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/widgets/order_tile_skeleton.dart';
import 'package:garden_of_eve/utils/utils.dart';

class OrderListScreen extends StatelessWidget {
  OrderListScreen({Key? key}) : super(key: key);
  final orderController = Get.put(OrderListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GradientContainer(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(45),
              ),
              padding: const EdgeInsets.fromLTRB(15, 15, 30, 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 24,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'My Orders',
                    style: quicksandSemiBold.copyWith(
                      color: whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: Obx(
                () => showOrders(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showOrders() {
    if (orderController.isLoading.value) {
      return const LoadingListView(
        itemCount: 10,
        isHorizontalDirection: false,
        skeleton: OrderTileSkeleton(),
      );
    }
    if (orderController.orders.isEmpty) {
      return const ErrorInfoDisplay(
        message: 'No orders yet',
      );
    }

    return OrderListView();
  }
}
