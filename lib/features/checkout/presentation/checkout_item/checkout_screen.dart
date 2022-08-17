import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          hasBackButton: true,
        ),
        body: const Center(
          child: Text('Checkout Screen'),
        ),
      ),
    );
  }
}
