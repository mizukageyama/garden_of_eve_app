import 'package:flutter/material.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ShippingAddrFormController extends GetxController {
  final saFullName = TextEditingController();
  final saContactNum = TextEditingController();
  final saHouseAddr = TextEditingController();
  String saRegion = '';
  String saProvince = '';
  String saCity = '';
  String saBarangay = '';

  void resetInputAddr() {
    saFullName.clear();
    saContactNum.clear();
    saHouseAddr.clear();
    saRegion = '';
    saProvince = '';
    saCity = '';
    saBarangay = '';
  }

  get fullAddressInput => '${saHouseAddr.text} $saBarangay $saCity $saProvince';
}
