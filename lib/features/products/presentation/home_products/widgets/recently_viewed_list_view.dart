import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/product_tile_rect.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class RecentlyViewedListView extends StatelessWidget {
  RecentlyViewedListView({
    Key? key,
  }) : super(key: key);

  final HomeProdController homeProdController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        key: const PageStorageKey<String>('pageOne'),
        controller: homeProdController.recentScroller,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: homeProdController.recentlyViewed.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 0,
                  right: 20,
                ),
                child: ProductTileRect(
                  product: homeProdController.recentlyViewed[index],
                  width: 290,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
