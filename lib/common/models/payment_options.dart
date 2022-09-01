class Payment {
  static final List<PaymentOpt> options = [
    PaymentOpt(
      title: 'Debit/Credit Card',
      logo: 'assets/icons/mastercard.png',
    ),
    PaymentOpt(
      title: 'Paypal',
      logo: 'assets/icons/paypal.png',
    ),
    PaymentOpt(
      title: 'GCash',
      logo: 'assets/icons/gcash.png',
    ),
    PaymentOpt(
      title: 'Cash on Delivery',
      logo: 'assets/icons/cod2.png',
    ),
  ];
}

class PaymentOpt {
  String title;
  String logo;

  PaymentOpt({
    required this.title,
    required this.logo,
  });
}
