import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          hasBackButton: true,
          backgroundColor: lightGreenColor,
          contentColor: whiteColor,
          title: 'My Vouchers',
        ),
        body: const Center(
          child: Text('Vouchers'),
        ),
      ),
    );
  }
}
