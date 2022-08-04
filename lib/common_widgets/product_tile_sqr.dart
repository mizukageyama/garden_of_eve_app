import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';

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
      height: 250,
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
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xff828599),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        _product.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xffa3a6ac),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "₱${_product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Color(0xff6bbc9a),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -100,
                child: SizedBox(
                  height: 140,
                  child: Image.network(
                    _product.imgUrl,
                    fit: BoxFit.fitHeight,
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
