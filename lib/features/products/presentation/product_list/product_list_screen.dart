import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/custom_appbar.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          hasBackButton: true,
        ),
        body: Center(
          child: Text(
            'Product List Screen',
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
