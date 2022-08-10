import 'package:garden_of_eve/utils/utils.dart';

class ProductInfoController extends GetxController {
  final RxDouble totalPrice = 0.00.obs;

  void totalPriceByQty(double price, int qty) => totalPrice.value = price * qty;

  get total => totalPrice.value;
}
