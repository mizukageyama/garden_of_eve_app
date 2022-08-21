import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/common/widgets/shipping_addr_form.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/checkout_controller.dart';
import 'package:garden_of_eve/features/profile/presentation/address/address_controller.dart';
import 'package:garden_of_eve/features/profile/presentation/address/widgets/shipping_addr_list_view.dart';
import 'package:garden_of_eve/utils/utils.dart';

class Step1ShippingAddr extends StatelessWidget {
  Step1ShippingAddr({Key? key}) : super(key: key);
  final CheckoutController _checkoutController = Get.find();
  final ShippingAddrController shippingController =
      Get.put(ShippingAddrController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your saved shipping address',
          style: quicksandMedium.copyWith(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => showAddress(),
        ),
        Text(
          'Enter new shipping address',
          style: quicksandMedium.copyWith(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(key: _formKey, child: ShippingAddrForm()),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              _checkoutController.nextStep();
            }
          },
          child: GradientContainer(
            borderRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
              child: Text(
                'Confirm and continue',
                textAlign: TextAlign.center,
                style: quicksandSemiBold.copyWith(
                  fontSize: 14,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget showAddress() {
    if (shippingController.isLoading.value) {
      return const SizedBox(
        height: 85,
        child: Center(
          child: Text(
            'Loading...',
          ),
        ),
      );
    }
    if (shippingController.addrList.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }

    return ShippingAddrListView(
      backgroundColor: bgColor,
    );
  }
}
