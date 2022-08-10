import 'package:flutter/cupertino.dart';
import 'package:garden_of_eve/common_widgets/product_tile_sqr.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductListView extends StatelessWidget {
  ProductListView({
    Key? key,
  }) : super(key: key);

  final HomeProdController homeProdController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 256,
      child: Obx(
        () => ListView.builder(
          key: const PageStorageKey<String>('pageOne'),
          controller: homeProdController.productScroller,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: homeProdController.products.length + 1,
          itemBuilder: (context, index) {
            if (index == homeProdController.products.length) {
              return Visibility(
                visible: homeProdController.productHasMoreData,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: CupertinoActivityIndicator(),
                ),
              );
            }
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 20 : 0,
                    right: 20,
                  ),
                  child: ProductTile(
                    product: homeProdController.products[index],
                    width: 185,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
