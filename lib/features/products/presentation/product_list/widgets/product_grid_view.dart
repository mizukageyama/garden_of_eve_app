import 'package:flutter/cupertino.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/features/products/presentation/product_list/product_list_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductGridView extends StatelessWidget {
  ProductGridView({Key? key}) : super(key: key);
  final ProdListController prodListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      controller: prodListController.prodListScroller,
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 15,
            maxCrossAxisExtent: 185,
            mainAxisExtent: 271,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ProductTile(
                  product: prodListController.prodList[index],
                  width: 185,
                ),
              );
            },
            childCount: prodListController.prodList.length,
          ),
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
    );
  }
}
