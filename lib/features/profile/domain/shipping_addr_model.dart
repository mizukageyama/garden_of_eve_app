class ShippingAddr {
  int addressId;
  String fullName;
  String address;
  String contactNumber;

  ShippingAddr({
    required this.addressId,
    required this.fullName,
    required this.address,
    required this.contactNumber,
  });

  factory ShippingAddr.fromJson(Map<String, dynamic> json) {
    return ShippingAddr(
      addressId: json['address_id'] as int,
      fullName: json['full_name'] as String,
      address: json['address'] as String,
      contactNumber: json['contact_number'] as String,
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =  Map<String, dynamic>();
  //   data['address_id'] = this.addressId;
  //   data['full_name'] = this.fullName;
  //   data['address'] = this.address;
  //   data['contact_number'] = this.contactNumber;
  //   return data;
  // }
}
