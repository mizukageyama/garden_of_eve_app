import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/shipping_address/domain/shipping_addr_model.dart';

class ShippingAddrTile extends StatelessWidget {
  const ShippingAddrTile({
    Key? key,
    required this.addr,
    this.forListView = false,
    this.showRemove = false,
    this.backgroundColor = whiteColor,
    this.fontColor = darkGreyColor,
    this.removeFunction,
  }) : super(key: key);

  final ShippingAddr addr;
  final bool forListView;
  final bool showRemove;
  final Color backgroundColor;
  final Color fontColor;
  final void Function(int)? removeFunction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: forListView
              ? const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                )
              : null,
          decoration: BoxDecoration(
            borderRadius: forListView ? BorderRadius.circular(12) : null,
            color: backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${addr.fullName} | ${addr.contactNumber}',
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: fontColor,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                addr.address,
                style: quicksandMedium.copyWith(
                  fontSize: 15,
                  color: fontColor,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: showRemove,
          child: Positioned(
            right: 0,
            top: -5,
            child: GestureDetector(
              onTap: () {
                if (showRemove) {
                  removeFunction!(addr.addressId!);
                  //print('Removing: ${addr.address} \nRefetch Shipping Addr');
                }
              },
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: neutralGreyColor,
                ),
                child: const Icon(
                  Icons.close,
                  color: whiteColor,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
