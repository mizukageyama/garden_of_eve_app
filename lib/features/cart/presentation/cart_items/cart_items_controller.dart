import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/models/promo_model.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/constants/app_items.dart';
import 'package:garden_of_eve/features/cart/data/cart_repository.dart';
import 'package:garden_of_eve/features/cart/domain/cart_model.dart';
import 'package:garden_of_eve/features/orders/domain/order_items_model.dart';
import 'package:garden_of_eve/utils/format.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CartListController extends GetxController {
  //Repository
  final CartRepository _cartRepo = CartRepository();
  final RxBool selectAll = false.obs;

  final TextEditingController pCode = TextEditingController();
  final Rxn<Promo?> promoObx = Rxn<Promo>();

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
  void onInit() {
    print('onInit | CartListController');
    getCartData(isRefresh: true);
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

  List<OrderItem> orderItems() {
    return selectedItems
        .map(
          (item) => OrderItem(
            cartId: item.id,
            id: item.productInfo.id,
            name: item.productInfo.name,
            description:
                "Price: ${Format.amount(item.productInfo.getPrice * item.qty.value)}, "
                "Quantity: ${item.qty}${item.productInfo.discount == null ? "" : ", Discount: ${item.productInfo.discount!.discountPercent}%"}",
            imgUrl: item.productInfo.imgUrl,
          ),
        )
        .toList();
  }

  void checkPromoCode() {
    Promo? promoResult;
    promoResult =
        promoCodes.singleWhere((item) => item.promoCode == pCode.text);
    promoObx.value = promoResult;
  }

  double calculateLess() {
    if (promoObx.value == null) {
      return 0.00;
    }
    if (promoObx.value!.isPercentBasis) {
      return ((promoObx.value!.percentDiscount! / 100) * subTotal());
    } else {
      return promoObx.value!.amountLess!;
    }
  }

  double total() {
    double total = subTotal() - calculateLess();
    return total < 0 ? 0.00 : total;
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

  Future<void> removeFromCart(int index) async {
    final Cart temp = cartList[index];
    cartList.removeAt(index);
    Map<String, dynamic> message = await _cartRepo.removeCartItem(
      temp.id,
    );

    bool success = message['success'] == 1;
    if (!success) {
      cartList.insert(index, temp);
    }
    Get.snackbar(
      success ? 'Success' : 'Failed',
      success ? 'Removed from Cart' : message['message'],
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: oxfordBlueColor,
      duration: const Duration(seconds: 1),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
