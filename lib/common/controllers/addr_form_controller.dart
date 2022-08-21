import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/models/ph_addr_model.dart';
import 'package:garden_of_eve/constants/ph_location.dart';
import 'package:garden_of_eve/utils/utils.dart';

class AddrFormController extends GetxController {
  final PhAddress addr = PhAddress.fromJson(PhLocation.data);
  Rxn<Region?> selectedRegion = Rxn<Region>();
  Rxn<Province?> selectedProvince = Rxn<Province>();
  Rxn<Municipality?> selectedMunicipality = Rxn<Municipality>();
  String selectedBarangay = '';

  final regionKey = GlobalKey<FormFieldState>();
  final provinceKey = GlobalKey<FormFieldState>();
  final municipalityKey = GlobalKey<FormFieldState>();
  final barangayKey = GlobalKey<FormFieldState>();

  List<String> get regions => addr.regionNames;

  List<String> get provinces => selectedRegion.value == null
      ? []
      : addr.getProvinces(selectedRegion.value!);

  List<String> get municipalities => selectedProvince.value == null
      ? []
      : addr.getMunicipalities(selectedProvince.value!);

  List<String> get barangays => selectedMunicipality.value == null
      ? []
      : addr.getBarangays(selectedMunicipality.value!);

  set region(String regionName) {
    resetProvince();
    resetMunicipality();
    resetBarangay();
    barangayKey.currentState!.reset();
    selectedRegion.value = addr.findRegion(regionName);
  }

  set province(String provinceName) {
    resetMunicipality();
    resetBarangay();
    selectedProvince.value =
        addr.findProvince(selectedRegion.value!, provinceName);
  }

  set municipality(String municipalityName) {
    resetBarangay();
    selectedMunicipality.value =
        addr.findMunicipality(selectedProvince.value!, municipalityName);
  }

  set barangay(String barangayName) {
    selectedBarangay = barangayName;
  }

  void resetProvince() {
    provinceKey.currentState!.reset();
    selectedProvince.value = null;
  }

  void resetMunicipality() {
    municipalityKey.currentState!.reset();
    selectedMunicipality.value = null;
  }

  void resetBarangay() {
    barangayKey.currentState!.reset();
    selectedBarangay = '';
  }
}
