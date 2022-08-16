import 'package:flutter/cupertino.dart';
import 'package:garden_of_eve/common_widgets/product_tile_rect.dart';
import 'package:garden_of_eve/features/favorites/presentation/favorites/favorites_controller.dart';
import 'package:garden_of_eve/utils/utils.dart';

class FavListView extends StatelessWidget {
  FavListView({Key? key}) : super(key: key);
  final FavoritesController favController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey<String>('pageTwo'),
      controller: favController.favListScroller,
      padding: const EdgeInsets.fromLTRB(15, 60, 15, 20),
      shrinkWrap: true,
      itemCount: favController.favList.length + 1,
      itemBuilder: (context, index) {
        if (index == favController.favList.length) {
          return Visibility(
            visible: favController.hasMoreData,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ProductTileRect(
            product: favController.favList[index],
          ),
        );
      },
    );
  }
}
