class OrderItem {
  String name;
  String description;

  OrderItem({
    required this.name,
    required this.description,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =  Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['description'] = this.description;
  //   return data;
  // }
}
