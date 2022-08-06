import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/constants.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            'Favorites Screen',
            style: quicksandSemiBold.copyWith(
              color: oxfordBlueColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
