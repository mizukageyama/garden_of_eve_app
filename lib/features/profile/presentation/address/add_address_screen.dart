import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/shipping_addr_form_controller.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/common/widgets/shipping_addr_form.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/profile/presentation/address/address_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({Key? key}) : super(key: key);
  final shippingController = Get.put(ShippingAddrController());
  final formController = Get.put(
    ShippingAddrFormController(),
    tag: 'user_address',
  );
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: CustomAppBar(
          hasBackButton: true,
          backgroundColor: lightGreenColor,
          contentColor: whiteColor,
          title: 'New Shipping Address',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'Please fill up the form',
                  style: quicksandSemiBold.copyWith(
                    fontSize: 17,
                    color: oxfordBlueColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: ShippingAddrForm(
                    formController: formController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await formController.setAddrFromInput();
                        if (formController.hasSelected) {
                          await shippingController
                              .addAddress(formController.addrModel!);
                        } else {
                          print('No input detected');
                        }
                      }
                    },
                    child: GradientContainer(
                      width: 190,
                      borderRadius: BorderRadius.circular(10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        'Add Address',
                        textAlign: TextAlign.center,
                        style: quicksandSemiBold.copyWith(
                          fontSize: 14,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
