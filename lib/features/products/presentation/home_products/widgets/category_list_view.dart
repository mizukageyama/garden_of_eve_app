import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({
    Key? key,
  }) : super(key: key);

  final HomeProdController homeProdController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        key: const PageStorageKey<String>('pageOne'),
        controller: homeProdController.categoryScroller,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: homeProdController.categories.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 35 : 0,
                  right: 35,
                ),
                child: Obx(
                  () => InkWell(
                    splashColor: Colors.transparent,
                    onTap: () => homeProdController.selectCategory(index),
                    child: homeProdController.activeCategoryIndex.value == index
                        ? GradientContainer(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 18,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            child: Text(
                              homeProdController.categories[index],
                              style: quicksandBold.copyWith(
                                color: whiteColor,
                                fontSize: 14,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: Text(
                              homeProdController.categories[index],
                              style: quicksandBold.copyWith(
                                color: greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
