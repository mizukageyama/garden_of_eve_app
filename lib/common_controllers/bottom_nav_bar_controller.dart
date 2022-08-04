import 'package:garden_of_eve/utils/utils.dart';

class BottomNavBarController extends GetxController {
  RxInt activeIndex = 0.obs;

  void changeIndex(int newIndex) {
    if (newIndex == activeIndex.value) {
      return;
    }
    activeIndex.value = newIndex;
  }

  bool isActive(int index) {
    if (index == activeIndex.value) {
      return true;
    }
    return false;
  }
}
