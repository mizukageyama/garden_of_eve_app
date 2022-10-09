import 'package:garden_of_eve/features/shipping_address/data/shipping_addr_repository.dart';
import 'package:garden_of_eve/features/shipping_address/domain/shipping_addr_model.dart';
import 'package:garden_of_eve/utils/dialogs.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ShippingAddrController extends GetxController {
  final ShippingAddrRepository _addrRepo = ShippingAddrRepository();
  final RxList<ShippingAddr> addrList = RxList.empty(growable: true);
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

  Future<void> addAddress(ShippingAddr addr) async {
    showLoading();
    Map<String, dynamic> message = await _addrRepo.addAddress(1, addr);
    bool success = message['success'] == 1;
    dismissDialog();
    if (success) {
      await getAddress(isRefresh: true);
      Get.back();
    }
    showSnackBar(
      title: success ? 'Success' : 'Failed',
      message: message['message'],
    );
  }

  Future<void> updateAddress(ShippingAddr addr) async {
    showLoading();
    Map<String, dynamic> message = await _addrRepo.updateAddress(1, addr);
    bool success = message['success'] == 1;
    dismissDialog();
    if (success) {
      await getAddress(isRefresh: true);
    }
    showSnackBar(
      title: success ? 'Success' : 'Failed',
      message: message['message'],
    );
  }

  Future<void> deleteAddress(int addressId) async {
    showLoading();
    Map<String, dynamic> message = await _addrRepo.deleteAddress(addressId);
    bool success = message['success'] == 1;
    dismissDialog();
    if (success) {
      await getAddress(isRefresh: true);
    }
    showSnackBar(
      title: success ? 'Success' : 'Failed',
      message: message['message'],
    );
  }
}
