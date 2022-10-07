import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/shipping_addr_form_controller.dart';
import 'package:garden_of_eve/common/widgets/error_info_display.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/common/widgets/loading_list_view.dart';
import 'package:garden_of_eve/common/widgets/shipping_addr_form.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/widgets/cart_tile_skeleton.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/checkout_controller.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/radio_step_controller.dart';
import 'package:garden_of_eve/features/checkout/presentation/checkout_item/widgets/expandable_container.dart';
import 'package:garden_of_eve/features/profile/presentation/address/address_controller.dart';
import 'package:garden_of_eve/features/profile/presentation/address/widgets/shipping_addr_list_view.dart';
import 'package:garden_of_eve/utils/dialogs.dart';
import 'package:garden_of_eve/utils/utils.dart';

class Step1ShippingAddr extends StatelessWidget {
  Step1ShippingAddr({Key? key}) : super(key: key);
  final CheckoutController _checkoutController = Get.find();
  final shippingController = Get.put(ShippingAddrController());
  final shippingFormController = Get.put(ShippingAddrFormController());
  final _formKey = GlobalKey<FormState>();
  final _step1 = Get.put(RadioStepController(optionLength: 2), tag: 'step1');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select shipping address for your order',
          style: quicksandSemiBold.copyWith(
            fontSize: 17,
            color: oxfordBlueColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ExpandableRadioOpt(
          title: Text(
            'Your saved shipping address',
            style: quicksandMedium.copyWith(
              fontSize: 15,
              color: darkGreyColor,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => showAddress(),
              ),
            ],
          ),
          radioValue: 1,
          stepController: _step1,
        ),
        const SizedBox(
          height: 15,
        ),
        ExpandableRadioOpt(
          title: Text(
            'Enter new shipping address',
            style: quicksandMedium.copyWith(
              fontSize: 15,
              color: darkGreyColor,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: ShippingAddrForm(
                  formController: shippingFormController,
                ),
              ),
            ],
          ),
          radioValue: 2,
          stepController: _step1,
        ),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () async {
            if (_step1.activeRadioButton.value == 1) {
              if (shippingFormController.hasSelected) {
                _checkoutController.nextStep();
              } else {
                showSnackBar(
                  title: 'No address is selected',
                  message: 'Please select address to proceed',
                );
              }
            } else {
              if (_formKey.currentState!.validate()) {
                await shippingFormController.setAddrFromInput();
                _checkoutController.shippingAddress =
                    shippingFormController.addrModel!;
                _checkoutController.nextStep();
              }
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
      return const LoadingListView(
        isHorizontalDirection: false,
        itemCount: 2,
        skeleton: CartTileSkeleton(),
      );
    }
    if (shippingController.addrList.isEmpty) {
      return const ErrorInfoDisplay(
        message: 'No saved address',
        isWhiteBackground: false,
      );
    }

    return SizedBox(
      height: 200,
      child: ShippingAddrListView(
        backgroundColor: bgColor,
        selectAddr: (selectedAddr) async {
          await shippingFormController.setAddrFromSaved(selectedAddr);
          _checkoutController.shippingAddress =
              shippingFormController.addrModel!;
        },
        selectedId: shippingFormController.selectedAddrId,
      ),
    );
  }
}
