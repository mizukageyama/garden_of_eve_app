import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/orders/domain/order_model.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/widgets/order_items_list.dart';
import 'package:garden_of_eve/features/profile/presentation/address/widgets/shipping_addr_tile.dart';
import 'package:garden_of_eve/utils/format.dart';

class OrderInfoScreen extends StatelessWidget {
  const OrderInfoScreen({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(
        hasBackButton: true,
        backgroundColor: lightGreenColor,
        contentColor: whiteColor,
        title: 'Order Info',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Order Placed: ",
                    style: quicksandBold.copyWith(
                      fontSize: 16,
                      color: darkGreyColor,
                    ),
                  ),
                  Text(
                    Format.date(order.createdAt),
                    style: quicksandBold.copyWith(
                      fontSize: 15,
                      color: neutralGreyColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    order.status,
                    style: quicksandBold.copyWith(
                      fontSize: 16,
                      color: greenColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 0.9,
                color: neutralGreyColor,
              ),
              const SizedBox(height: 10),
              Text(
                'Shipping Info',
                style: quicksandBold.copyWith(
                  fontSize: 16,
                  color: greyColor,
                ),
              ),
              const SizedBox(height: 10),
              ShippingAddrTile(addr: order.shippingInfo),
              const SizedBox(height: 10),
              const Divider(
                thickness: 0.9,
                color: neutralGreyColor,
              ),
              const SizedBox(height: 10),
              Text(
                'Plants Ordered:',
                style: quicksandBold.copyWith(
                  fontSize: 16,
                  color: greyColor,
                ),
              ),
              const SizedBox(height: 10),
              OrderItemsList(
                items: order.orderItems,
                showAll: true,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "Total: ",
                    style: quicksandBold.copyWith(
                      fontSize: 16,
                      color: darkGreyColor,
                    ),
                  ),
                  Text(
                    "₱${Format.amount(order.total)}",
                    style: quicksandBold.copyWith(
                      fontSize: 18,
                      color: lightGreenColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
