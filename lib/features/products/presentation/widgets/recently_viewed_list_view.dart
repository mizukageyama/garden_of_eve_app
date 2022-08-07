import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/product_tile_rect.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';

class RecentlyViewedListView extends StatelessWidget {
  const RecentlyViewedListView({
    Key? key,
    required this.recentlyViewed,
    required this.scroller,
  }) : super(key: key);

  final Set<Product> recentlyViewed;
  final ScrollController scroller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        controller: scroller,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: recentlyViewed.length,
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
                  product: recentlyViewed.elementAt(index),
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
