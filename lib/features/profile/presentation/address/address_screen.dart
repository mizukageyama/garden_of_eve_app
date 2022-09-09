import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/common/widgets/loading_list_view.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/widgets/cart_tile_skeleton.dart';
import 'package:garden_of_eve/features/profile/presentation/address/add_address_screen.dart';
import 'package:garden_of_eve/features/profile/presentation/address/address_controller.dart';
import 'package:garden_of_eve/features/profile/presentation/address/widgets/shipping_addr_list_view.dart';
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
                  InkWell(
                    splashColor: Colors.transparent,
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
              print(
                  'Snackbar/dialog that says, "you can only have 5 minumum saved addresses"');
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
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }

    return ShippingAddrListView(
      showRemove: true,
    );
  }
}
