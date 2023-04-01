import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/features/orders/domain/order_items_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class OrderItemsList extends StatelessWidget {
  const OrderItemsList({
    Key? key,
    required this.items,
    this.bordered = true,
    this.showAll = false,
  }) : super(key: key);

  final List<OrderItem> items;
  final bool bordered;
  final bool showAll;

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
    List<OrderItem> itemsCopy = List.empty(growable: true);
    if (!showAll) {
      itemsCopy.addAll(items.take(2));
    } else {
      itemsCopy.addAll(items);
    }
    return itemsCopy
        .map((data) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: bordered
                          ? Border.all(
                              color: neutralGreyColor,
                            )
                          : null,
                      color: bordered ? null : bgColor,
                      borderRadius: bordered ? null : BorderRadius.circular(8),
                    ),
                    child: CachedNetworkImage(
                      width: 25,
                      height: 25,
                      imageUrl: data.imgUrl,
                      memCacheHeight: 400,
                      errorWidget: (context, url, error) => Center(
                        child: Text(
                          'Could not load image',
                          textAlign: TextAlign.center,
                          style: quicksandMedium.copyWith(
                            color: neutralGreyColor,
                            fontSize: 13.5,
                          ),
                        ),
                      ),
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
