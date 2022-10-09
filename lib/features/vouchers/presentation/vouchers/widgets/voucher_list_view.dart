import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/vouchers/presentation/vouchers/voucher_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class VoucherListView extends StatelessWidget {
  VoucherListView({Key? key}) : super(key: key);

  final VoucherController _vouchers = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      itemCount: _vouchers.voucherList.length,
      itemBuilder: (context, index) {
        final _voucher = _vouchers.voucherList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            _voucher.title,
          ),
        );
      },
    );
  }
}
