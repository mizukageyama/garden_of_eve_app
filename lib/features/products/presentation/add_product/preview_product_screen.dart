import 'dart:io';
import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/widgets/icon_info_row.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/widgets/quantity_incrementor.dart';
import 'package:garden_of_eve/utils/format.dart';
import 'package:garden_of_eve/utils/utils.dart';

class PreviewScreen extends StatelessWidget {
  PreviewScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  final RxInt quantity = 1.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        height: 240,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(width: 0, color: whiteColor),
                                color: whiteColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 30,
                              child: SizedBox(
                                height: 230,
                                child: Image.file(
                                  File(product.imgUrl),
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Text(
                                        'Could not load image',
                                        textAlign: TextAlign.center,
                                        style: quicksandMedium.copyWith(
                                          color: neutralGreyColor,
                                          fontSize: 13.5,
                                        ),
                                      ),
                                    );
                                  },
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                product.name,
                                style: quicksandSemiBold.copyWith(
                                  color: darkGreyColor,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                product.description,
                                textAlign: TextAlign.justify,
                                style: quicksandSemiBold.copyWith(
                                  color: neutralGreyColor,
                                  fontSize: 12,
                                  height: 1.7,
                                ),
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
                                          quantity.value = value;
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
              child: InkWell(
                splashColor: Colors.transparent,
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
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: neutralGreyColor.withOpacity(.1),
                blurRadius: 5,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 65,
          child: Row(
            children: [
              Obx(
                () => Text(
                  "₱${Format.amount(product.getPrice * quantity.value)}",
                  style: quicksandSemiBold.copyWith(
                      fontSize: 18, color: darkGreyColor),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: GradientContainer(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Text(
                    'ADD TO CART',
                    textAlign: TextAlign.center,
                    style: quicksandSemiBold.copyWith(
                        fontSize: 14, color: whiteColor),
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
