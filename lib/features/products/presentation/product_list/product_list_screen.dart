import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/common/widgets/loading_grid_view.dart';
import 'package:garden_of_eve/common/widgets/product_tile_sqr_skeleton.dart';
import 'package:garden_of_eve/features/products/presentation/product_list/product_list_controller.dart';
import 'package:garden_of_eve/features/products/presentation/product_list/widgets/product_grid_view.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key}) : super(key: key);
  final prodListController = Get.put(ProdListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          hasBackButton: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Obx(
                () => _showProducts(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showProducts() {
    if (prodListController.isLoadingProd.value) {
      return const LoadingGridView(
        widthPerTile: 185,
        skeleton: ProductTileSkeleton(
          width: 185,
        ),
      );
    }
    if (prodListController.prodList.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ProductGridView(),
    );
  }
}
