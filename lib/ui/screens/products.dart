import 'package:flutter/material.dart';
import 'package:garden_of_eve/data/api/product_api.dart';
import 'package:garden_of_eve/ui/components/product_tile.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductApi _productApi = ProductApi();

  @override
  void initState() {
    _productApi.productsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffecf3e3),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              const Text('Plants'),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: ProductTile(),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ProductTile(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: ProductTile(),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ProductTile(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
