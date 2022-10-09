class Voucher {
  final String voucherCode;
  final double? percentDiscount;
  final double? amountLess;
  final String title;

  Voucher({
    required this.voucherCode,
    this.percentDiscount,
    this.amountLess,
    required this.title,
  });

  bool get isPercentBasis => percentDiscount != null && amountLess == null;

  double? get discount => isPercentBasis ? percentDiscount : amountLess;
}
