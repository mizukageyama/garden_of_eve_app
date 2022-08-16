import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/gradient_container.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/favorites/presentation/favorites/favorites_controller.dart';
import 'package:garden_of_eve/features/favorites/presentation/favorites/widgets/favorites_list_view.dart';
import 'package:garden_of_eve/utils/utils.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  final favController = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Stack(
                children: [
                  _showFavorites(),
                  GradientContainer(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(45),
                      bottomLeft: Radius.circular(15),
                    ),
                    padding: const EdgeInsets.fromLTRB(15, 15, 30, 15),
                    child: Text(
                      'My Favorites',
                      style: quicksandSemiBold.copyWith(
                        color: whiteColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showFavorites() {
    if (favController.isLoading.value) {
      return const SizedBox(
        height: 85,
        child: Center(
          child: Text(
            'Loading...',
          ),
        ),
      );
    }
    if (favController.favList.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }

    return FavListView();
  }
}
