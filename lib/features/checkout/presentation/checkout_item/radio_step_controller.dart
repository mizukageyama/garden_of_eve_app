import 'package:garden_of_eve/utils/utils.dart';

class RadioStepController extends GetxController {
  final RxInt activeRadioButton = 1.obs;

  final List<ExpandableController> options = [
    ExpandableController(initialExpanded: true),
  ];

  RadioStepController({int optionLength = 1}) {
    for (int a = 0; a < optionLength - 1; a++) {
      options.add(ExpandableController());
    }
  }

  void togglePanels(int selected) {
    if (activeRadioButton.value != selected) {
      int oldActive = activeRadioButton.value;
      activeRadioButton.value = selected;
      options[oldActive - 1].toggle();
      options[selected - 1].toggle();
    }
  }

  int get activeIndex => activeRadioButton.value;
}
