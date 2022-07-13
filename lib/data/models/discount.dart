class Discount {
  int id;
  String name;
  String desc;
  int discountPercent;
  DateTime createdAt;
  DateTime modifiedAt;

  Discount({
    required this.id,
    required this.name,
    required this.desc,
    required this.discountPercent,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      id: json['id'] as int,
      name: json['name'] as String,
      desc: json['desc'] as String,
      discountPercent: json['discount_percent'] as int,
      createdAt: DateTime.parse(json['created_at']),
      modifiedAt: DateTime.parse(json['modified_at']),
    );
  }
}
