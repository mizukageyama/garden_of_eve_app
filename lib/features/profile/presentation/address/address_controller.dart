import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/features/profile/data/shipping_addr_repository.dart';
import 'package:garden_of_eve/features/profile/domain/shipping_addr_model.dart';
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
    Map<String, dynamic> message = await _addrRepo.addAddress(1, addr);
    bool success = message['success'] == 1;
    if (success) {
      await getAddress(isRefresh: true);
      Get.back();
    }
    Get.snackbar(
      success ? 'Success' : 'Failed',
      message['message'],
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: oxfordBlueColor,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  Future<void> updateAddress(ShippingAddr addr) async {
    Map<String, dynamic> message = await _addrRepo.updateAddress(1, addr);
    bool success = message['success'] == 1;
    if (success) {
      await getAddress(isRefresh: true);
    }
    Get.snackbar(
      success ? 'Success' : 'Failed',
      message['message'],
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: oxfordBlueColor,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  Future<void> deleteAddress(int addressId) async {
    Map<String, dynamic> message = await _addrRepo.deleteAddress(addressId);
    bool success = message['success'] == 1;
    if (success) {
      await getAddress(isRefresh: true);
    }
    Get.snackbar(
      success ? 'Success' : 'Failed',
      message['message'],
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: oxfordBlueColor,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
