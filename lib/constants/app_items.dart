import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/models/drawer_model.dart';
import 'package:garden_of_eve/utils/utils.dart';

final List<DrawerModel> drawerItems = [
  //DrawerModel(icon: FontAwesomeIcons.user, title: 'Profile'),
  DrawerModel(icon: Icons.local_mall_rounded, title: 'Cart'),
  DrawerModel(icon: FontAwesomeIcons.fileInvoice, title: 'My Orders'),
  DrawerModel(icon: FontAwesomeIcons.sliders, title: 'Settings'),
  DrawerModel(icon: FontAwesomeIcons.rightFromBracket, title: 'Sign out'),
];
