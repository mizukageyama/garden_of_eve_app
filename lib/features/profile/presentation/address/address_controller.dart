import 'package:garden_of_eve/features/profile/data/shipping_addr_repository.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ShippingAddrController extends GetxController {
  final ShippingAddrRepository _addrRepo = ShippingAddrRepository();
  final RxList addrList = RxList.empty(growable: true);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAddress(isRefresh: true);
    super.onInit();
  }

  Future<void> getAddress({bool isRefresh = false}) async {
    if (isRefresh) {
      isLoading.value = true;
    }

    final results = await _addrRepo.getShippingAddr(1);

    if (isRefresh) {
      addrList.value = results;
      isLoading.value = false;
    } else {
      addrList.addAll(results);
    }
  }
}
