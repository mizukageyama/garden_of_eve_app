class OrderItem {
  int id;
  String name;
  String description;
  String imgUrl;

  OrderItem({
    required this.id,
    required this.name,
    required this.description,
    required this.imgUrl,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['product_id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      imgUrl: json['img_url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
      };
}
