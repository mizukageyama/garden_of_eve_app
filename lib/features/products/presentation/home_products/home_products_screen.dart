import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/product_tile_sqr.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_controller.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);
  final homeProdController = HomeProdController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffecf3e3),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Plants'),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder<List<Product>>(
                  future: homeProdController.getProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      final error = snapshot.error;
                      return Center(
                        child: Text(
                          "Error: " + error.toString(),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('No data'),
                        );
                      }
                      return Flexible(
                        child: ListView.builder(
                          //scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final product = snapshot.data![index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  //padding: const EdgeInsets.only(right: 15),
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
                    return Container();
                  }),
              // const SizedBox(
              //   height: 20,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //     Expanded(
              //       child: ProductTile(),
              //     ),
              //     SizedBox(
              //       width: 15,
              //     ),
              //     Expanded(
              //       child: ProductTile(),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
