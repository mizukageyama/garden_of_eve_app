import 'package:garden_of_eve/data/models/product.dart';

class Cart {
  int id;
  int qty;
  DateTime createdAt;
  DateTime modifiedAt;
  Product productInfo;

  Cart({
    required this.id,
    required this.qty,
    required this.createdAt,
    required this.modifiedAt,
    required this.productInfo,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'] as int,
      qty: json['qty'] as int,
      createdAt: DateTime.parse(json['created_at']),
      modifiedAt: DateTime.parse(json['modified_at']),
      productInfo: Product.fromJson(json['product_info']),
    );
  }
}
