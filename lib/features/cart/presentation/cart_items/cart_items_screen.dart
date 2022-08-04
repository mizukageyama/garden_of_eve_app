import 'package:flutter/material.dart';

class CartItemScreen extends StatelessWidget {
  const CartItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: const Text('Cart Item Screen'),
      ),
    );
  }
}
