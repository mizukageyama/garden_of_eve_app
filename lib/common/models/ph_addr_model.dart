class PhAddress {
  List<Region> regions;

  PhAddress({required this.regions});

  factory PhAddress.fromJson(Map<String, dynamic> jsonData) {
    List<Region> list = List.empty(growable: true);

    jsonData.forEach((key, value) {
      list.add(Region.fromJson(key, value));
    });
    return PhAddress(regions: list);
  }

  List<String> get regionNames {
    return regions.map((item) => item.regionName).toList();
  }

  List<String> getProvinces(Region selectedRegion) {
    return selectedRegion.provinces.map((item) => item.provinceName).toList();
  }

  List<String> getMunicipalities(Province selectedProvince) {
    return selectedProvince.municipalities
        .map((item) => item.municipalityName)
        .toList();
  }

  List<String> getBarangays(Municipality selectedMunicipality) {
    return selectedMunicipality.barangays;
  }

  @override
  String toString() {
    return '\nREGIONS\n$regions\n\n';
  }

  Region findRegion(String regionName) {
    return regions.firstWhere((item) => item.regionName == regionName);
  }

  Province findProvince(Region region, String provinceName) {
    return region.provinces
        .firstWhere((item) => item.provinceName == provinceName);
  }

  Municipality findMunicipality(Province province, String municipalityName) {
    return province.municipalities
        .firstWhere((item) => item.municipalityName == municipalityName);
  }
}

class Region {
  String regionNumber;
  String regionName;
  List<Province> provinces;

  Region({
    required this.regionNumber,
    required this.regionName,
    required this.provinces,
  });

  factory Region.fromJson(String number, Map<String, dynamic> jsonData) {
    List<Province> list = List.empty(growable: true);
    jsonData['province_list'].forEach((key, value) {
      list.add(Province.fromJson(key, value));
    });

    return Region(
        regionNumber: number,
        regionName: jsonData['region_name'],
        provinces: list);
  }

  @override
  String toString() {
    return '\nregion_number: $regionNumber ($regionName)\nProvinces: $provinces\n';
  }
}

class Province {
  String provinceName;
  List<Municipality> municipalities;

  Province({
    required this.provinceName,
    required this.municipalities,
  });

  factory Province.fromJson(
      String provinceName, Map<String, dynamic> jsonData) {
    List<Municipality> list = List.empty(growable: true);
    jsonData['municipality_list'].forEach((key, value) {
      list.add(Municipality.fromJson(key, value));
    });

    return Province(
      provinceName: provinceName,
      municipalities: list,
    );
  }

  @override
  String toString() {
    return 'province_name: $provinceName \nMunicipalities: \n$municipalities';
  }
}

class Municipality {
  String municipalityName;
  List<String> barangays;

  Municipality({
    required this.municipalityName,
    required this.barangays,
  });

  factory Municipality.fromJson(
      String municipalityName, Map<String, dynamic> jsonData) {
    return Municipality(
      municipalityName: municipalityName,
      barangays: jsonData['barangay_list'] as List<String>,
    );
  }

  @override
  String toString() {
    return 'municipality_name: $municipalityName \nbarangay_list: $barangays\n';
  }
}
