import 'package:garden_of_eve/features/vouchers/domain/voucher_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

class VoucherController extends GetxController {
  final RxBool isLoading = true.obs;
  //final VoucherRepository _voucherRepo = VoucherRepository();
  RxList<Voucher> voucherList = RxList.empty(growable: true);

  final List<Voucher> promoCodes = [
    Voucher(
      voucherCode: '20_Promo_Holiday',
      percentDiscount: 20,
      title: 'Less 20% Promo',
    ),
    Voucher(
      voucherCode: 'Plant_12',
      percentDiscount: 50,
      title: 'Suki Less 50%',
    ),
    Voucher(
      voucherCode: 'Holiday_Save',
      percentDiscount: 25,
      title: 'Less 25% Promo',
    ),
    Voucher(
      voucherCode: 'PLANT101',
      amountLess: 1000,
      title: 'Less 1000 pesos',
    ),
  ];

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), () {
      voucherList.addAll(promoCodes);
      isLoading.value = false;
    });
    super.onInit();
  }
}
