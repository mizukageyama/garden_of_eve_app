class Promo {
  final String promoCode;
  final double? percentDiscount;
  final double? amountLess;
  final String title;

  Promo({
    required this.promoCode,
    this.percentDiscount,
    this.amountLess,
    required this.title,
  });

  bool get isPercentBasis => percentDiscount != null && amountLess == null;

  double? get discount => isPercentBasis ? percentDiscount : amountLess;
}
