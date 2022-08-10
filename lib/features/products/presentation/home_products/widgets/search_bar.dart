import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';

class SearchProductField extends StatelessWidget {
  const SearchProductField({Key? key}) : super(key: key);

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
        });
  }
}
