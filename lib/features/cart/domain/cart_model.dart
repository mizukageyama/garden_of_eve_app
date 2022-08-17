import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class Cart {
  int id;
  RxInt qty;
  DateTime createdAt;
  DateTime modifiedAt;
  Product productInfo;
  RxBool isSelected;

  Cart({
    required this.id,
    required this.qty,
    required this.createdAt,
    required this.modifiedAt,
    required this.productInfo,
    required this.isSelected,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'] as int,
      qty: (json['qty'] as int).obs,
      createdAt: DateTime.parse(json['created_at']),
      modifiedAt: DateTime.parse(json['modified_at']),
      productInfo: Product.fromJson(json['product_info']),
      isSelected: false.obs,
    );
  }

  @override
  String toString() {
    return 'Product: ${productInfo.name}, qty: $qty, isSelected: $isSelected';
  }
}
