import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/cart/domain/cart_model.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/widgets/quantity_incrementor.dart';
import 'package:garden_of_eve/utils/format.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CartTile extends StatelessWidget {
  CartTile({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartListController cartListController = Get.find();
  final Cart cartItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Row(
        children: [
          Visibility(
            child: Obx(
              () => Checkbox(
                side: const BorderSide(
                  color: greyColor,
                ),
                checkColor: whiteColor,
                activeColor: greenColor,
                value: cartItem.isSelected.value,
                onChanged: (value) {
                  cartItem.isSelected.value = value!;
                  if (cartItem.isSelected.value) {
                    cartListController.selectedItems.add((cartItem));
                  } else {
                    cartListController.selectAll.value = false;
                    cartListController.selectedItems.remove((cartItem));
                  }
                  // print('Selected Cart Items:');
                  // print(cartListController.selectedItems);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 65,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: CachedNetworkImage(
                            memCacheHeight: 400,
                            imageUrl: cartItem.productInfo.imgUrl,
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
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cartItem.productInfo.name,
                                style: quicksandMedium.copyWith(
                                    color: oxfordBlueColor,
                                    fontSize: 13.5,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 2,
                              ),
                              Obx(
                                () => Text(
                                  '₱${Format.amount(cartItem.productInfo.getPrice * cartItem.qty.value)}',
                                  style: quicksandBold.copyWith(
                                    color: greenColor,
                                    fontSize: 13.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  QuantityIncrementor(
                    initialVal: cartItem.qty.value,
                    style2: true,
                    maxLimit: cartItem.productInfo.qty,
                    onChange: (value) => cartItem.qty.value = value,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
