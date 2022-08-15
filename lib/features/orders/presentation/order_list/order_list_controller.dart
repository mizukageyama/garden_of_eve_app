import 'package:garden_of_eve/features/orders/data/order_repository.dart';
import 'package:garden_of_eve/features/orders/domain/order_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class OrderListController extends GetxController {
  List<Order> orders = List.empty(growable: true);
  final OrderRepository _orderRepo = OrderRepository();
  RxBool isLoading = false.obs;
  int currentPage = 1;
  int totalPages = 0;
  bool hasMoreData = false;

  @override
  void onInit() async {
    await getOrders(isRefresh: true);
    super.onInit();
  }

  Future<void> getOrders({bool isRefresh = false}) async {
    if (isRefresh) {
      isLoading.value = true;
      currentPage = 1;
    } else {
      if (!hasMoreData) {
        return;
      }
    }

    final results = await _orderRepo.geCartList(1, currentPage);

    if (isRefresh) {
      orders = results;
      isLoading.value = false;
    } else {
      orders.addAll(results);
    }

    totalPages = _orderRepo.totalPage;
    hasMoreData = currentPage < totalPages;

    if (hasMoreData) currentPage++;
  }
}
