import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/product_tile_sqr.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    Key? key,
    required this.products,
    required this.scroller,
  }) : super(key: key);

  final List<Product> products;
  final ScrollController scroller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 256,
      child: ListView.builder(
        controller: scroller,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 0,
                  right: 20,
                ),
                child: ProductTile(
                  product: products[index],
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
