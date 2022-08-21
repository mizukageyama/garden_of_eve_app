import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/features/profile/presentation/address/address_controller.dart';
import 'package:garden_of_eve/features/profile/presentation/address/widgets/shipping_addr_tile.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ShippingAddrListView extends StatelessWidget {
  ShippingAddrListView({
    Key? key,
    this.showRemove = false,
    this.backgroundColor = whiteColor,
  }) : super(key: key);

  final ShippingAddrController shippingController = Get.find();
  final bool showRemove;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      itemCount: shippingController.addrList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ShippingAddrTile(
            addr: shippingController.addrList[index],
            forListView: true,
            showRemove: showRemove,
            backgroundColor: backgroundColor,
          ),
        );
      },
    );
  }
}
