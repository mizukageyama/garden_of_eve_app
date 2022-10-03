import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/features/orders/domain/order_model.dart';
import 'package:garden_of_eve/features/orders/presentation/order_info/order_info_screen.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/widgets/order_items_list.dart';
import 'package:garden_of_eve/features/profile/presentation/address/widgets/shipping_addr_tile.dart';
import 'package:garden_of_eve/utils/format.dart';
import 'package:garden_of_eve/utils/utils.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                order.status,
                style: quicksandBold.copyWith(
                  fontSize: 16,
                  color: greyColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ShippingAddrTile(addr: order.shippingInfo),
          const SizedBox(height: 10),
          const Divider(
            thickness: 0.9,
            color: neutralGreyColor,
          ),
          const SizedBox(height: 10),
          OrderItemsList(items: order.orderItems),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                "₱${Format.amount(order.total)}",
                style: quicksandSemiBold.copyWith(
                  fontSize: 18,
                  color: darkGreyColor,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => OrderInfoScreen(order: order));
                  },
                  child: GradientContainer(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    child: Text(
                      'VIEW ORDER',
                      textAlign: TextAlign.center,
                      style: quicksandSemiBold.copyWith(
                          fontSize: 14, color: whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
