import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/cart/domain/cart_model.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/widgets/quantity_incrementor.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CartTile extends StatelessWidget {
  CartTile({
    Key? key,
    required this.cartItem,
  })  : _qty = cartItem.qty.obs,
        super(key: key);
  final Cart cartItem;
  final RxInt _qty;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
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
                    //color: lightGreenColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: CachedNetworkImage(
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
                          '₱${(cartItem.productInfo.getPrice * _qty.value).toStringAsFixed(2)}',
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
            initialVal: cartItem.qty,
            style2: true,
            maxLimit: cartItem.productInfo.qty,
            onChange: (value) => _qty.value = value,
          )
        ],
      ),
    );
  }
}
