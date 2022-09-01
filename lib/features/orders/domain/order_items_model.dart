class OrderItem {
  int id;
  String name;
  String description;

  OrderItem({
    required this.id,
    required this.name,
    required this.description,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
      };
}
