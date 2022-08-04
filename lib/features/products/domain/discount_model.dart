class Discount {
  int id;
  String name;
  String description;
  int discountPercent;
  DateTime createdAt;
  DateTime modifiedAt;

  Discount({
    required this.id,
    required this.name,
    required this.description,
    required this.discountPercent,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      id: json['id'] as int,
      name: json['name'],
      description: json['description'],
      discountPercent: json['discount_percent'],
      createdAt: DateTime.parse(json['created_at']),
      modifiedAt: DateTime.parse(json['modified_at']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'discount_percent': discountPercent,
        'created_at': createdAt,
        'modified_at': modifiedAt
      };
}
