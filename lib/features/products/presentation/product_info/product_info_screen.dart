import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/user_data_controller.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/product_info_controller.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/widgets/add_to_cart_row.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/widgets/icon_info_row.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/widgets/quantity_incrementor.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductInfoScreen extends StatelessWidget {
  ProductInfoScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  final ProductInfoController _prodInfo = Get.put(ProductInfoController());
  final UserData _userData = Get.find();

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
                        child: StackedImage(
                          containerHeight: 50,
                          imgHeight: 230,
                          imgUrl: product.imgUrl,
                          leftPosition: 30,
                          hasTopLeftRadius: true,
                          hasTopRightRadius: true,
                          radius: 50,
                          //topPosition: -5,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 24,
                      color: oxfordBlueColor,
                    ),
                  ),
                  Visibility(
                    visible: _userData.isCurrentUserAdmin,
                    child: GestureDetector(
                      onTap: () async {
                        //TO DO: add discount
                        debugPrint('add discount');
                      },
                      child: GradientContainer(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Add Discount',
                              style: quicksandSemiBold.copyWith(
                                color: whiteColor,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.discount_outlined,
                              size: 15,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
