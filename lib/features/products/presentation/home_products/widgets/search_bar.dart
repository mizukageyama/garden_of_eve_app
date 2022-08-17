import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/search_controller.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/features/products/presentation/product_list/product_list_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class SearchProductField extends StatelessWidget {
  SearchProductField({Key? key}) : super(key: key);
  final SearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        minLines: 1,
        decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.all(0),
          fillColor: whiteColor,
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
        onFieldSubmitted: (value) {
          print('Submitted: $value');
          if (value != '') {
            searchController.setSearchKey = value;
            Get.to(() => ProductListScreen());
          }
        });
  }
}
