import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/product_tile_sqr_skeleton.dart';

class LoadingProducts extends StatelessWidget {
  const LoadingProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 256,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 20 : 0,
              right: 20,
            ),
            child: const ProductTileSkeleton(
              width: 185,
            ),
          );
        },
      ),
    );
  }
}
