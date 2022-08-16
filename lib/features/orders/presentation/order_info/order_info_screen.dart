import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/features/orders/domain/order_model.dart';

class OrderInfoScreen extends StatelessWidget {
  const OrderInfoScreen({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        hasBackButton: true,
      ),
      body: Center(
        child: Text(
          'order info ${order.id}',
        ),
      ),
    ));
  }
}
