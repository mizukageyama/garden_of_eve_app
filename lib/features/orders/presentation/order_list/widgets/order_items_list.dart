import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/features/orders/domain/order_items_model.dart';

class OrderItemsList extends StatelessWidget {
  const OrderItemsList({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<OrderItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...orderItemTile(),
      ],
    );
  }

  List<Widget> orderItemTile() {
    return items
        .map((data) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: neutralGreyColor,
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/plant.png',
                      width: 25,
                      height: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.name,
                          style: quicksandBold.copyWith(
                            fontSize: 15,
                            color: greenColor,
                          ),
                        ),
                        Text(
                          data.description,
                          style: quicksandMedium.copyWith(
                            fontSize: 13,
                            color: neutralGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }
}
