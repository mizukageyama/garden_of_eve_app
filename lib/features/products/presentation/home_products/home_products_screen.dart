import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/common/widgets/loading_list_view.dart';
import 'package:garden_of_eve/common/widgets/product_tile_rect_skeleton.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_controller.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_screen.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_controller.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/widgets/_widgets.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  final homeProdController = Get.put(HomeProdController());
  final cartListController = Get.put(CartListController());
  final homePageScroller = ScrollController();
  final categoryScroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            rightWidget: [
              Obx(
                () => Badge(
                  padding: const EdgeInsets.all(7.0),
                  badgeColor: greenColor,
                  showBadge: cartListController.cartList.isNotEmpty,
                  position: const BadgePosition(top: -12, end: -10),
                  badgeContent: Text(
                    '${cartListController.cartList.length}',
                    style: quicksandRegular.copyWith(
                      color: whiteColor,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => Get.to(() => CartItemScreen()),
                    child: const Icon(
                      Icons.local_mall_outlined,
                      size: 26,
                      color: oxfordBlueColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SearchProductField(),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SingleChildScrollView(
                  controller: homePageScroller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => _showCategories(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Flexible(
                        child: Obx(
                          () => _showProducts(),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Recently viewed',
                          style: quicksandSemiBold.copyWith(
                            color: oxfordBlueColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Flexible(
                        child: Obx(
                          () => _showRecentlyViewed(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showCategories() {
    if (homeProdController.isLoadingCategory.value) {
      return const LoadingListView(
        skeleton: CategorySkeleton(),
        skeletonHeight: 35,
      );
    }
    if (homeProdController.categories.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
    return CategoryListView();
  }

  Widget _showProducts() {
    if (homeProdController.isLoadingCategory.value) {
      return const LoadingListView(
        skeleton: ProductTileSkeleton(
          width: 185,
        ),
        skeletonHeight: 256,
      );
    }
    if (homeProdController.categories.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
    return PageStorage(
      bucket: homeProdController.bucket,
      child: homeProdController.currentCategoryContainer,
    );
  }

  Widget _showRecentlyViewed() {
    if (homeProdController.isLoadingCategory.value) {
      return const LoadingListView(
        skeleton: ProductTileRectSkeleton(
          width: 290,
        ),
        skeletonHeight: 95,
      );
    }
    if (homeProdController.recentlyViewed.isEmpty) {
      return SizedBox(
        height: 120,
        child: Center(
          child: Text(
            'No recent viewed yet',
            style: quicksandMedium.copyWith(
              color: neutralGreyColor,
            ),
          ),
        ),
      );
    }
    return RecentlyViewedListView();
  }
}
