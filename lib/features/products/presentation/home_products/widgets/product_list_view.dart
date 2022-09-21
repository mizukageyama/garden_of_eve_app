import 'package:flutter/cupertino.dart';
import 'package:garden_of_eve/common/widgets/loading_list_view.dart';
import 'package:garden_of_eve/common/widgets/product_tile_sqr.dart';
import 'package:garden_of_eve/common/widgets/product_tile_sqr_skeleton.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/prod_by_category_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    final ProdByCategoryController _controller =
        Get.put(ProdByCategoryController(category), tag: category);

    return Obx(() => _showProductsByCategory(_controller));
  }

  Widget _showProductsByCategory(ProdByCategoryController _controller) {
    if (_controller.isLoadingProd.value) {
      return const LoadingListView(
        skeleton: ProductTileSkeleton(
          width: 185,
        ),
        skeletonHeight: 256,
      );
    }
    if (_controller.products.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
    return SizedBox(
      height: 256,
      child: ListView.builder(
        key: key,
        controller: _controller.productScroller,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _controller.products.length + 1,
        itemBuilder: (context, index) {
          if (index == _controller.products.length) {
            return Visibility(
              visible: _controller.productHasMoreData,
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
                  product: _controller.products[index],
                  width: 185,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
