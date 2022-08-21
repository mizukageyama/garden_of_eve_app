import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/addr_form_controller.dart';
import 'package:garden_of_eve/common/services/validator.dart';
import 'package:garden_of_eve/common/widgets/custom_dropdown2.dart';
import 'package:garden_of_eve/common/widgets/custom_text_field.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ShippingAddrForm extends StatelessWidget {
  ShippingAddrForm({Key? key}) : super(key: key);
  final AddrFormController _addrForm = Get.put(AddrFormController());
  final RxBool isDropdownClicked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                labelText: 'Full Name',
                floatLabel: true,
                borderRadius: BorderRadius.circular(10),
                validator: Validator().notEmpty,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomTextField(
                labelText: 'Contact Number',
                floatLabel: true,
                keyboardType: TextInputType.phone,
                validator: Validator().notEmpty,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomDropdown2(
          dropdownItems: _addrForm.regions,
          hintText: 'Region',
          onChanged: (value) {
            _addrForm.region = '$value';
          },
          validator: (value) {
            if (_addrForm.selectedRegion.value == null) {
              return 'This is a required field';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => CustomDropdown2(
            dpKey: _addrForm.provinceKey,
            dropdownItems: _addrForm.provinces,
            hintText: 'Province',
            onChanged: (value) {
              _addrForm.province = '$value';
            },
            validator: (value) {
              if (_addrForm.selectedProvince.value == null) {
                return 'This is a required field';
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => CustomDropdown2(
            dpKey: _addrForm.municipalityKey,
            dropdownItems: _addrForm.municipalities,
            hintText: 'Municipality',
            onChanged: (value) {
              _addrForm.municipality = '$value';
            },
            validator: (value) {
              if (_addrForm.selectedMunicipality.value == null) {
                return 'This is a required field';
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => CustomDropdown2(
            dpKey: _addrForm.barangayKey,
            dropdownItems: _addrForm.barangays,
            hintText: 'Barangay',
            onChanged: (value) {
              _addrForm.barangay = '$value';
            },
            validator: (value) {
              if (_addrForm.selectedBarangay == '') {
                return 'This is a required field';
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          labelText: 'Street Name, Building, House No.',
          floatLabel: true,
          validator: Validator().notEmpty,
        ),
        Visibility(
          visible: isDropdownClicked.value,
          child: const SizedBox(
            height: 200,
          ),
        ),
      ],
    );
  }
}
