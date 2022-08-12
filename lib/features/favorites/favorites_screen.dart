import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/custom_appbar.dart';
import 'package:garden_of_eve/features/favorites/favorites_controller.dart';
import 'package:garden_of_eve/features/favorites/favorites_list_view.dart';
import 'package:garden_of_eve/utils/utils.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  final favController = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          hasBackButton: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: _showFavorites(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showFavorites() {
    // if (favController.isLoadingProd.value) {
    //   return const SizedBox(
    //     height: 85,
    //     child: Center(
    //       child: Text(
    //         'Loading...',
    //       ),
    //     ),
    //   );
    // }
    // if (favController.cartList.isEmpty) {
    //   return const SizedBox(
    //     height: 0,
    //     width: 0,
    //   );
    // }

    return FavListView();
  }
}
