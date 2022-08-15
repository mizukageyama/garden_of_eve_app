import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class FavoritesController extends GetxController {
  final favListScroller = ScrollController();
  List<Product> favList = List.empty(growable: true);
  bool productHasMoreData = false;
}
