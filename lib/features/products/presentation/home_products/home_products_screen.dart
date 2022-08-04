import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/product_tile_sqr.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);
  final homeProdController = Get.put(HomeProdController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffecf3e3),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/icons/menu.png',
                      height: 24,
                      width: 24,
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/images/profile.jpg',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                    minLines: 1,
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: const EdgeInsets.all(0),
                      fillColor: Colors.white,
                      labelText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                      ),
                    ),
                    onFieldSubmitted: (value) {}),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => showCategories(),
              ),
              const SizedBox(
                height: 15,
              ),
              Flexible(
                child: Obx(
                  () => showProducts(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showCategories() {
    if (homeProdController.isLoading.value) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
    if (homeProdController.categories.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: homeProdController.categories.length,
        itemBuilder: (context, index) {
          final category = homeProdController.categories[index];
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
                    onTap: () => homeProdController.selectCategory(index),
                    child: homeProdController.activeCategoryIndex.value == index
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 18,
                            ),
                            decoration: BoxDecoration(
                              color: homeProdController
                                          .activeCategoryIndex.value ==
                                      index
                                  ? const Color(0xff4dbd90)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              category,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : Text(
                            category,
                            style: const TextStyle(
                              color: Color(0xff828599),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
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

  Widget showProducts() {
    if (homeProdController.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }
    if (homeProdController.products.isEmpty) {
      return const Center(
        child: Text('No data'),
      );
    }
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: homeProdController.products.length,
        itemBuilder: (context, index) {
          final product = homeProdController.products[index];
          return Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                //padding: const EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.only(
                  left: index == 0 ? 15 : 0,
                  right: 15,
                ),
                child: ProductTile(
                  product: product,
                  width: 200,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
