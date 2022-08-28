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

  void togglePanels(int selected) {
    if (activeRadioButton.value != selected) {
      activeRadioButton.value = selected;
      cont1.toggle();
      cont2.toggle();
    }
  }

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
        GestureDetector(
          onTap: () {
            togglePanels(1);
          },
          child: Row(
            children: [
              Obx(
                () => Radio(
                  value: 1,
                  groupValue: activeRadioButton.value,
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  activeColor: greenColor,
                  onChanged: (value) {
                    togglePanels(1);
                  },
                ),
              ),
              Text(
                'Your saved shipping address',
                style: quicksandMedium.copyWith(
                  fontSize: 15,
                  color: darkGreyColor,
                ),
              ),
            ],
          ),
        ),
        ExpandableNotifier(
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
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            togglePanels(2);
          },
          child: Row(
            children: [
              Obx(
                () => Radio(
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  activeColor: greenColor,
                  value: 2,
                  groupValue: activeRadioButton.value,
                  onChanged: (value) {
                    togglePanels(2);
                  },
                ),
              ),
              Text(
                'Enter new shipping address',
                style: quicksandMedium.copyWith(
                  fontSize: 15,
                  color: darkGreyColor,
                ),
              ),
            ],
          ),
        ),
        ExpandableNotifier(
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
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () async {
            if (activeRadioButton.value == 1) {
              if (shippingFormController.hasSelected) {
                _checkoutController.nextStep();
              } else {
                print('Please select address');
              }
            } else {
              if (_formKey.currentState!.validate()) {
                await shippingFormController.setAddrFromInput();
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
        selectAddr: (selectedAddr) =>
            shippingFormController.setAddrFromSaved(selectedAddr),
        selectedId: shippingFormController.selectedAddrId,
      ),
    );
  }
}
