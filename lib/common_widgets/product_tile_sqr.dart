import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/product_tile_text.dart';
import 'package:garden_of_eve/constants/constants.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required Product product,
    this.width = double.infinity,
  })  : _product = product,
        super(key: key);
  final Product _product;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 256,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                height: 156,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.only(top: 50),
                  child: ProductTileText(
                    name: _product.name,
                    desc: _product.description,
                    price: _product.price,
                  ),
                ),
              ),
              Positioned(
                top: -100,
                child: SizedBox(
                  height: 140,
                  child: CachedNetworkImage(
                    imageUrl: _product.imgUrl,
                    errorWidget: (context, url, error) => Center(
                      child: SizedBox(
                        width: width,
                        child: Text(
                          'Could not load image',
                          textAlign: TextAlign.center,
                          style: quicksandMedium.copyWith(
                            color: neutralGreyColor,
                            fontSize: 13.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
