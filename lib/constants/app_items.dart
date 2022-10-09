import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/models/drawer_model.dart';
import 'package:garden_of_eve/common/models/payment_options.dart';
import 'package:garden_of_eve/features/vouchers/domain/voucher_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

final List<DrawerModel> drawerItems = [
  DrawerModel(
    icon: FontAwesomeIcons.user,
    title: 'Profile',
    screenRoute: '/profile',
  ),
  DrawerModel(
    icon: Icons.local_mall_rounded,
    title: 'Cart',
    screenRoute: '/cart',
  ),
  DrawerModel(
    icon: FontAwesomeIcons.fileInvoice,
    title: 'My Orders',
    screenRoute: '/orders',
  ),
  DrawerModel(
    icon: FontAwesomeIcons.rightFromBracket,
    title: 'Sign out',
    screenRoute: '',
  ),
];

final List<PaymentOpt> paymentOptions = [
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
