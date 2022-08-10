import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/_common_widgets.dart';
import 'package:garden_of_eve/common_widgets/custom_appbar.dart';
import 'package:garden_of_eve/features/products/presentation/product_list/product_list_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key}) : super(key: key);
  final prodListController = Get.put(ProdListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
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
      return Text('Loading');
      //return const LoadingProducts();
    }
    if (prodListController.prodList.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomScrollView(
        shrinkWrap: true,
        controller: prodListController.prodListScroller,
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 15,
              maxCrossAxisExtent: 185,
              mainAxisExtent: 271,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ProductTile(
                  product: prodListController.prodList[index],
                  width: 185,
                ),
              );
            }, childCount: prodListController.prodList.length),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Visibility(
                  visible: prodListController.productHasMoreData,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: CupertinoActivityIndicator(),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
