import 'package:garden_of_eve/data/models/discount.dart';
import 'package:intl/intl.dart';

class Product {
  int id;
  String name;
  String desc;
  double price;
  int qty;
  DateTime createdAt;
  DateTime modifiedAt;
  Discount? discount;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.qty,
    required this.createdAt,
    required this.modifiedAt,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    Discount? discountInfo;
    if (json['discount'] != null) {
      discountInfo = Discount.fromJson(json['discount']);
    }
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      desc: json['desc'] as String,
      price: json['price'].toDouble(),
      qty: json['qty'] as int,
      createdAt: DateTime.parse(json['created_at']),
      modifiedAt: DateTime.parse(json['modified_at']),
      discount: discountInfo,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'desc': desc,
        'price': price,
        'qty': qty,
        'created_at': createdAt,
        'modified_at': modifiedAt
      };

  @override
  String toString() {
    return '\nname: $name, createdAt: ${DateFormat.yMMMMd().format(createdAt)} ${DateFormat.jm().format(createdAt)}, '
        'modifiedAt: ${DateFormat.yMMMM().format(modifiedAt)} ${DateFormat.jm().format(modifiedAt)}';
  }
}
