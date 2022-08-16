import 'package:garden_of_eve/utils/utils.dart';

class MainController extends GetxController {
  final RxDouble xOffset = 0.0.obs;
  final RxDouble yOffset = 0.0.obs;
  final RxDouble scaleFactor = 1.0.obs;
  final RxBool clickableLanding = false.obs;

  void openDrawer() {
    xOffset.value = 230;
    yOffset.value = 150;
    scaleFactor.value = 0.6;
    clickableLanding.value = true;
  }

  void closeDrawer() {
    xOffset.value = 0;
    yOffset.value = 0;
    scaleFactor.value = 1;
    clickableLanding.value = false;
  }
}
