import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/product_info_controller.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/widgets/add_to_cart_row.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/widgets/icon_info_row.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/widgets/product_info_tile.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/widgets/quantity_incrementor.dart';
import 'package:garden_of_eve/utils/format.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductInfoScreen extends StatelessWidget {
  ProductInfoScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  final ProductInfoController _prodInfo = Get.put(ProductInfoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        height: 240,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            StackedImage(
                              containerHeight: 50,
                              imgHeight: 230,
                              imgUrl: product.imgUrl,
                              leftPosition: 30,
                              hasTopLeftRadius: true,
                              hasTopRightRadius: true,
                              radius: 50,
                              //topPosition: -5,
                            ),
                            Positioned(
                              top: 35,
                              right: 20,
                              child: SizedBox(
                                width: Get.width / 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const ProductInfoTile(
                                      text: 'Category',
                                      isTitle: true,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    ProductInfoTile(
                                      text: product.category.join(', '),
                                    ),
                                    Visibility(
                                      visible: product.discount != null,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const ProductInfoTile(
                                            text: 'Discount',
                                            isTitle: true,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          ProductInfoTile(
                                            text:
                                                '${product.discount?.discountPercent}% OFF',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ProductTileText(
                                forProductInfo: true,
                                product: product,
                                controller: _prodInfo,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              IconInfoRow(
                                info: [
                                  '${product.sunlight} Sunlight',
                                  product.watering,
                                  product.lifespan,
                                  product.size,
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Quantity',
                                    style: quicksandSemiBold.copyWith(
                                      color: darkGreyColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      QuantityIncrementor(
                                        maxLimit: product.qty,
                                        onChange: (value) {
                                          _prodInfo.setQty = value;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Stocks: ${product.qty}',
                                        style: quicksandMedium.copyWith(
                                          color: neutralGreyColor,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Price',
                                    style: quicksandSemiBold.copyWith(
                                      color: darkGreyColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "₱${Format.amount(product.getPrice)}",
                                        style: quicksandBold.copyWith(
                                          color: greenColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Visibility(
                                        visible: product.discount != null,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5,
                                          ),
                                          child: Text(
                                            "₱${Format.amount(product.price)}",
                                            style: quicksandSemiBold.copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationThickness: 2,
                                              color: neutralGreyColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 24,
                  color: oxfordBlueColor,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: AddToCartRow(
          product: product,
        ),
      ),
    );
  }
}
