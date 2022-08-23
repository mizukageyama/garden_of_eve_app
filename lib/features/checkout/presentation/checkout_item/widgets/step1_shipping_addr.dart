import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/shipping_addr_form_controller.dart';
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
  final shippingController = Get.put(ShippingAddrController());
  final shippingFormController = Get.put(ShippingAddrFormController());
  final _formKey = GlobalKey<FormState>();
  final RxInt activeRadioButton = 1.obs;
  final cont1 = ExpandableController(initialExpanded: true);
  final cont2 = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            activeRadioButton.value = 1;
            cont1.toggle();
            cont2.toggle();
          },
          child: Row(
            children: [
              Obx(
                () => Radio(
                  value: 1,
                  groupValue: activeRadioButton.value,
                  onChanged: null,
                ),
              ),
              Text(
                'Your saved shipping address',
                style: quicksandMedium.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => ExpandableNotifier(
            controller: cont1,
            child: Expandable(
              collapsed: const SizedBox(
                height: 0,
                width: 0,
              ),
              expanded: Column(
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
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            activeRadioButton.value = 2;
            cont1.toggle();
            cont2.toggle();
          },
          child: Row(
            children: [
              Obx(
                () => Radio(
                  value: 2,
                  groupValue: activeRadioButton.value,
                  onChanged: null,
                ),
              ),
              Text(
                'Enter new shipping address',
                style: quicksandMedium.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => ExpandableNotifier(
            controller: cont2,
            child: Expandable(
              collapsed: const SizedBox(
                height: 0,
                width: 0,
              ),
              expanded: Column(
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
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              print(
                  '${shippingFormController.saFullName.text} | ${shippingFormController.saContactNum.text}');
              print(shippingFormController.fullAddressInput);
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

    return SizedBox(
      height: 200,
      child: ShippingAddrListView(
        backgroundColor: bgColor,
      ),
    );
  }
}
