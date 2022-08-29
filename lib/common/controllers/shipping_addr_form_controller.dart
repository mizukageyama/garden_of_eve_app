import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/profile/domain/shipping_addr_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ShippingAddrFormController extends GetxController {
  final saFullName = TextEditingController();
  final saContactNum = TextEditingController();
  final saHouseAddr = TextEditingController();
  String saRegion = '';
  String saProvince = '';
  String saCity = '';
  String saBarangay = '';
  Rxn<ShippingAddr?> selectedShippingAddr = Rxn<ShippingAddr>();

  void resetInputAddr() {
    saFullName.clear();
    saContactNum.clear();
    saHouseAddr.clear();
    saRegion = '';
    saProvince = '';
    saCity = '';
    saBarangay = '';
  }

  String get fullAddressInput =>
      '${saHouseAddr.text} $saBarangay $saCity $saProvince';

  Future<void> setAddrFromInput() async {
    selectedShippingAddr.value = ShippingAddr(
      addressId: 1,
      fullName: saFullName.text,
      address: fullAddressInput,
      contactNumber: saContactNum.text,
    );
  }

  bool get hasSelected => selectedShippingAddr.value != null;

  Future<void> setAddrFromSaved(ShippingAddr savedAddr) async {
    selectedShippingAddr.value = savedAddr;
  }

  int get selectedAddrId => selectedShippingAddr.value?.addressId ?? 0;
}
