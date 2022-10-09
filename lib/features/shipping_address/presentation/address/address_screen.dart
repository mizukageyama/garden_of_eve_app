import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/error_info_display.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/common/widgets/loading_list_view.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/widgets/cart_tile_skeleton.dart';
import 'package:garden_of_eve/features/shipping_address/presentation/address/add_address_screen.dart';
import 'package:garden_of_eve/features/shipping_address/presentation/address/address_controller.dart';
import 'package:garden_of_eve/features/shipping_address/presentation/address/widgets/shipping_addr_list_view.dart';
import 'package:garden_of_eve/utils/dialogs.dart';
import 'package:garden_of_eve/utils/utils.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);
  final ShippingAddrController shippingController =
      Get.put(ShippingAddrController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GradientContainer(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(45),
              ),
              padding: const EdgeInsets.fromLTRB(15, 15, 30, 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 24,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'My Shipping Address',
                    style: quicksandSemiBold.copyWith(
                      color: whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: Obx(
                () => showAddress(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: darkGreenColor,
          onPressed: () {
            if (shippingController.addrList.isEmpty ||
                shippingController.addrList.length < 5) {
              Get.to(() => AddAddressScreen());
            } else {
              showSnackBar(
                title: 'Unable to proceed',
                message: 'You can only have a minumum of 5 saved addresses',
              );
            }
          },
          child: const Icon(
            Icons.add,
            color: whiteColor,
          ),
        ),
      ),
    );
  }

  Widget showAddress() {
    if (shippingController.isLoading.value) {
      return const LoadingListView(
        isHorizontalDirection: false,
        itemCount: 4,
        skeleton: CartTileSkeleton(),
      );
    }
    if (shippingController.addrList.isEmpty) {
      return const ErrorInfoDisplay(
        message: 'No saved address',
      );
    }

    return ShippingAddrListView(
      showRemove: true,
    );
  }
}
