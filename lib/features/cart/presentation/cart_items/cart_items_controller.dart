import 'package:flutter/cupertino.dart';
import 'package:garden_of_eve/features/cart/data/cart_repository.dart';
import 'package:garden_of_eve/features/cart/domain/cart_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CartListController extends GetxController {
  //Repository
  final CartRepository _cartRepo = CartRepository();
  final RxBool selectAll = false.obs;

  //Cart Variable
  final cartListScroller = ScrollController();
  RxList<Cart> cartList = RxList.empty(growable: true);
  RxBool isLoadingProd = true.obs;
  bool productHasMoreData = false;
  int currentPage = 1;
  late int totalPage;

  RxSet<Cart> selectedItems = RxSet<Cart>();

  //Methods
  @override
  void onInit() async {
    print('onInit | CartListController');
    await getCartData(isRefresh: true);
    cartListScroller.addListener(() async {
      if (cartListScroller.position.pixels ==
          cartListScroller.position.maxScrollExtent) {
        print('Fetching new data...');
        await getCartData();
      }
    });
    super.onInit();
  }

  double subTotal() {
    double subTotal = 0.0;
    selectedItems.map((item) {
      subTotal += (item.productInfo.getPrice * item.qty.value);
    }).toList();
    return subTotal;
  }

  //For Products
  Future<void> getCartData({bool isRefresh = false}) async {
    if (isRefresh) {
      isLoadingProd.value = true;
      currentPage = 1;
    } else {
      if (!productHasMoreData) {
        return;
      }
    }

    //TO DO: Change user Id after authentication
    final result = await _cartRepo.geCartList(
      3,
      currentPage,
    );

    if (isRefresh) {
      cartList.value = result;
      isLoadingProd.value = false;
    } else {
      cartList.addAll(result);
    }

    totalPage = _cartRepo.totalPage;
    productHasMoreData = currentPage < totalPage;

    if (productHasMoreData) currentPage++;
  }
}
