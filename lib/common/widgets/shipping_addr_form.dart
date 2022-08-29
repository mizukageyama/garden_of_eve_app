import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garden_of_eve/common/controllers/ph_address_controller.dart';
import 'package:garden_of_eve/common/controllers/shipping_addr_form_controller.dart';
import 'package:garden_of_eve/common/services/validator.dart';
import 'package:garden_of_eve/common/widgets/custom_dropdown2.dart';
import 'package:garden_of_eve/common/widgets/custom_text_field.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ShippingAddrForm extends StatelessWidget {
  ShippingAddrForm({
    Key? key,
    required ShippingAddrFormController formController,
  })  : _formController = formController,
        super(key: key);

  final ShippingAddrFormController _formController;
  final _phAddress = Get.put(PhAddressController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: _formController.saFullName,
                labelText: 'Full Name',
                floatLabel: true,
                inputFormatters: [
                  FilteringTextInputFormatter(
                    RegExp(r'^[a-zA-Z\s]+'),
                    allow: true,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                validator: Validator().notEmpty,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomTextField(
                controller: _formController.saContactNum,
                labelText: 'Contact Number',
                floatLabel: true,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter(
                    RegExp(r'^[0-9]*'),
                    allow: true,
                  ),
                  LengthLimitingTextInputFormatter(11),
                ],
                validator: Validator().notEmpty,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomDropdown2(
          dpKey: _phAddress.regionKey,
          dropdownItems: _phAddress.regions,
          hintText: 'Region',
          onChanged: (value) {
            _formController.saRegion = '$value';
            _phAddress.region = '$value';
          },
          validator: (value) {
            if (_phAddress.selectedRegion.value == null) {
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
            dpKey: _phAddress.provinceKey,
            dropdownItems: _phAddress.provinces,
            hintText: 'Province',
            onChanged: (value) {
              _formController.saProvince = '$value';
              _phAddress.province = '$value';
            },
            validator: (value) {
              if (_phAddress.selectedProvince.value == null) {
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
            dpKey: _phAddress.municipalityKey,
            dropdownItems: _phAddress.municipalities,
            hintText: 'City/Municipality',
            onChanged: (value) {
              _formController.saCity = '$value';
              _phAddress.municipality = '$value';
            },
            validator: (value) {
              if (_phAddress.selectedMunicipality.value == null) {
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
            dpKey: _phAddress.barangayKey,
            dropdownItems: _phAddress.barangays,
            hintText: 'Barangay',
            onChanged: (value) {
              _formController.saBarangay = '$value';
              _phAddress.barangay = '$value';
            },
            validator: (value) {
              if (_phAddress.selectedBarangay == '') {
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
          controller: _formController.saHouseAddr,
          labelText: 'Street Name, Building, House No.',
          floatLabel: true,
          validator: Validator().notEmpty,
        ),
      ],
    );
  }
}
