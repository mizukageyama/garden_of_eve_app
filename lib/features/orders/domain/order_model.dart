import 'package:garden_of_eve/features/orders/domain/order_items_model.dart';
import 'package:garden_of_eve/features/profile/domain/shipping_addr_model.dart';

class Order {
  int id;
  double total;
  String status;
  List<OrderItem> orderItems;
  ShippingAddr shippingInfo;
  DateTime createdAt;
  DateTime modifiedAt;

  Order({
    required this.id,
    required this.total,
    required this.status,
    required this.orderItems,
    required this.shippingInfo,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    final List<OrderItem> items = List.empty(growable: true);
    if (json['order_items'] != null) {
      json['order_items'].forEach((v) {
        items.add(OrderItem.fromJson(v));
      });
    }

    return Order(
      id: json['id'] as int,
      total: json['total'].toDouble(),
      status: json['status'],
      orderItems: items,
      shippingInfo: ShippingAddr.fromJson(json['shipping_info']),
      createdAt: DateTime.parse(json['created_at']),
      modifiedAt: DateTime.parse(json['modified_at']),
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['total'] = this.total;
  //   data['status'] = this.status;
  //   if (this.orderItems != null) {
  //     data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.shippingInfo != null) {
  //     data['shipping_info'] = this.shippingInfo!.toJson();
  //   }
  //   data['created_at'] = this.createdAt;
  //   data['modified_at'] = this.modifiedAt;
  //   return data;
  // }
}
