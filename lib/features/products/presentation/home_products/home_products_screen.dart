import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/custom_appbar.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_controller.dart';
import 'package:garden_of_eve/features/products/presentation/widgets/_widgets.dart';
import 'package:garden_of_eve/features/products/presentation/widgets/recently_viewed_list_view.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);
  final homeProdController = Get.put(HomeProdController());
  final landingPageScroller = ScrollController();
  final categoryScroller = ScrollController();
  final recentScroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: CustomAppBar(
            rightWidget: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/profile.jpg',
                ),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SearchProductField(),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SingleChildScrollView(
                  controller: landingPageScroller,
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
      return const LoadingCategory();
    }
    if (homeProdController.categories.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
    return CategoryListView(
      categories: homeProdController.categories,
      scroller: categoryScroller,
    );
  }

  Widget _showProducts() {
    if (homeProdController.isLoadingProd.value) {
      return const LoadingProducts();
    }
    if (homeProdController.products.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
    return ProductListView();
  }

  Widget _showRecentlyViewed() {
    if (homeProdController.isLoadingProd.value) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
      //return const LoadingProducts();
    }
    if (homeProdController.recentlyViewed.isEmpty) {
      return const Center(
        child: Text('No data'),
      );
    }
    return RecentlyViewedListView(
      recentlyViewed: homeProdController.recentlyViewed,
      scroller: recentScroller,
    );
  }
}
