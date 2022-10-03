import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/checkout_controller.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/widgets/order_items_list.dart';
import 'package:garden_of_eve/features/profile/presentation/address/widgets/shipping_addr_tile.dart';
import 'package:garden_of_eve/utils/utils.dart';

class Step3Review extends StatelessWidget {
  Step3Review({Key? key}) : super(key: key);
  final CheckoutController _checkoutController = Get.find();
  final CartListController _cart = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please confirm and submit your order',
          style: quicksandSemiBold.copyWith(
            fontSize: 17,
            color: oxfordBlueColor,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'By clicking submit order, you agree ',
          style: quicksandSemiBold.copyWith(
            fontSize: 14,
            color: neutralGreyColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: neutralGreyColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping Address',
                    style: quicksandSemiBold.copyWith(
                      fontSize: 15,
                      color: oxfordBlueColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _checkoutController.tapStep(0),
                    child: Text(
                      'Edit',
                      style: quicksandSemiBold.copyWith(
                        fontSize: 15,
                        color: greenColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => _checkoutController.getSelectedAddr == null
                    ? const SizedBox(
                        height: 0,
                        width: 0,
                      )
                    : ShippingAddrTile(
                        addr: _checkoutController.getSelectedAddr!,
                      ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: neutralGreyColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Option',
                    style: quicksandSemiBold.copyWith(
                      fontSize: 15,
                      color: oxfordBlueColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _checkoutController.tapStep(1),
                    child: Text(
                      'Edit',
                      style: quicksandSemiBold.copyWith(
                        fontSize: 15,
                        color: greenColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => _checkoutController.getSelectedPayment == null
                    ? const SizedBox(
                        height: 0,
                        width: 0,
                      )
                    : Row(
                        children: [
                          Image.asset(
                            _checkoutController.getSelectedPayment!.logo,
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            _checkoutController.getSelectedPayment!.title,
                            style: quicksandMedium.copyWith(
                              fontSize: 15,
                              color: darkGreyColor,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: neutralGreyColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Product Items',
                style: quicksandSemiBold.copyWith(
                  fontSize: 15,
                  color: oxfordBlueColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OrderItemsList(
                bordered: false,
                items: _cart.orderItems(),
                showAll: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
