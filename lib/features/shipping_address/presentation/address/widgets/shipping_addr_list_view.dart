import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/features/shipping_address/domain/shipping_addr_model.dart';
import 'package:garden_of_eve/features/shipping_address/presentation/address/address_controller.dart';
import 'package:garden_of_eve/features/shipping_address/presentation/address/widgets/shipping_addr_tile.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ShippingAddrListView extends StatelessWidget {
  ShippingAddrListView({
    Key? key,
    this.showRemove = false,
    this.backgroundColor = whiteColor,
    this.selectAddr,
    this.selectedId = 0,
  })  : _selectedId = selectedId.obs,
        super(key: key);

  final ShippingAddrController shippingController = Get.find();
  final bool showRemove;
  final Color backgroundColor;
  final void Function(ShippingAddr)? selectAddr;
  final int selectedId;
  final RxInt _selectedId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      itemCount: shippingController.addrList.length,
      itemBuilder: (context, index) {
        final _addr = shippingController.addrList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: GestureDetector(
            onTap: selectAddr == null ? null : () => selectAddr!(_addr),
            child: Obx(
              () => ShippingAddrTile(
                addr: shippingController.addrList[index],
                forListView: true,
                showRemove: showRemove,
                removeFunction: shippingController.deleteAddress,
                backgroundColor: _selectedId.value == _addr.addressId
                    ? lightGreenColor
                    : backgroundColor,
                fontColor: _selectedId.value == _addr.addressId
                    ? whiteColor
                    : darkGreyColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
