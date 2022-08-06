import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/constants.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            'Orders Screen',
            style: quicksandSemiBold.copyWith(
              color: oxfordBlueColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
