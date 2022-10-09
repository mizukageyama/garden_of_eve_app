import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/common/widgets/error_info_display.dart';
import 'package:garden_of_eve/common/widgets/loading_list_view.dart';
import 'package:garden_of_eve/common/widgets/product_tile_rect_skeleton.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/vouchers/presentation/vouchers/voucher_controller.dart';
import 'package:garden_of_eve/features/vouchers/presentation/vouchers/widgets/voucher_list_view.dart';
import 'package:garden_of_eve/utils/utils.dart';

class VoucherScreen extends StatelessWidget {
  VoucherScreen({Key? key}) : super(key: key);
  final _vouchers = Get.put(VoucherController());

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Obx(
                () => _showVouchers(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showVouchers() {
    if (_vouchers.isLoading.value) {
      return const LoadingListView(
        isHorizontalDirection: false,
        skeleton: ProductTileRectSkeleton(
          width: double.infinity,
        ),
      );
    }
    if (_vouchers.voucherList.isEmpty) {
      return const ErrorInfoDisplay(
        message: 'No vouchers',
      );
    }

    return VoucherListView();
  }
}
