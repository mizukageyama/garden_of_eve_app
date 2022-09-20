import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/controllers/user_data_controller.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/constants/app_text_styles.dart';
import 'package:garden_of_eve/features/cart/presentation/cart_items/cart_items_screen.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/order_list_screen.dart';
import 'package:garden_of_eve/features/profile/presentation/address/address_screen.dart';
import 'package:garden_of_eve/features/profile/presentation/profile/widgets/custom_icon_button.dart';
import 'package:garden_of_eve/features/profile/presentation/profile/widgets/title_and_subtext.dart';
import 'package:garden_of_eve/features/profile/presentation/settings/settings_screen.dart';
import 'package:garden_of_eve/features/profile/presentation/user_info/user_info_screen.dart';
import 'package:garden_of_eve/features/profile/presentation/vouchers/vouchers_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final UserData _userData = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    height: 210,
                    decoration: const BoxDecoration(
                      color: lightGreenColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _userData.currentUserFullName,
                          textAlign: TextAlign.center,
                          style: quicksandSemiBold.copyWith(
                            color: whiteColor,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          _userData.currentUser!.email,
                          textAlign: TextAlign.center,
                          style: quicksandSemiBold.copyWith(
                            color: whiteColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 95,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          height: 160,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 130,
                                padding:
                                    const EdgeInsets.fromLTRB(15, 40, 15, 10),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: neutralGreyColor.withOpacity(.1),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomIconButton(
                                      icon: Icons.receipt_long_outlined,
                                      title: 'My Orders',
                                      onTap: () => Get.to(
                                        () => OrderListScreen(),
                                      ),
                                    ),
                                    CustomIconButton(
                                      icon: Icons.local_mall,
                                      title: 'My Cart',
                                      onTap: () => Get.to(
                                        () => CartItemScreen(),
                                      ),
                                    ),
                                    CustomIconButton(
                                      icon: Icons.edit,
                                      title: 'User Data',
                                      onTap: () => Get.to(
                                        () => const UserInfoScreen(),
                                      ),
                                    ),
                                    CustomIconButton(
                                      icon: Icons.settings,
                                      title: 'Settings',
                                      onTap: () => Get.to(
                                        () => const SettingsScreen(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(7),
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    color: whiteColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/profile.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 130,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: neutralGreyColor.withOpacity(.1),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: CircularPercentIndicator(
                                    backgroundColor: Colors.transparent,
                                    radius: 30.0,
                                    lineWidth: 7.0,
                                    animation: true,
                                    percent: 0.75,
                                    center: Text(
                                      "75%",
                                      style: quicksandBold.copyWith(
                                        fontSize: 15,
                                        color: greenColor,
                                      ),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: greenColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const TextTitleSub(
                                  title: "Members' Level",
                                  subText: "Unlock next level",
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 130,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: neutralGreyColor.withOpacity(.1),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: CircularPercentIndicator(
                                    backgroundColor: Colors.transparent,
                                    radius: 30.0,
                                    lineWidth: 7.0,
                                    animation: true,
                                    percent: 0.5,
                                    center: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '5\n',
                                            style: quicksandBold.copyWith(
                                              fontSize: 16,
                                              color: greenColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'days',
                                            style: quicksandBold.copyWith(
                                              fontSize: 10,
                                              color: greenColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: greenColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const TextTitleSub(
                                  title: "Next Sale!",
                                  subText: "5 more days to go",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: neutralGreyColor.withOpacity(.1),
                            spreadRadius: 3,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.location_city,
                                size: 20,
                                color: greenColor,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              TextTitleSub(
                                title: "Shipping Address",
                                subText: "3 saved address",
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () => Get.to(
                              () => AddressScreen(),
                            ),
                            child: Text(
                              'View',
                              style: quicksandSemiBold.copyWith(
                                fontSize: 15,
                                color: greenColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: neutralGreyColor.withOpacity(.1),
                            spreadRadius: 3,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.receipt,
                                  size: 20,
                                  color: greenColor,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Flexible(
                                  child: TextTitleSub(
                                    title: "Claimed Vouchers",
                                    subText:
                                        "Receive vouchers by unlocking the next level of your membership!",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () => Get.to(
                              () => const VoucherScreen(),
                            ),
                            child: Text(
                              'View',
                              style: quicksandSemiBold.copyWith(
                                fontSize: 15,
                                color: greenColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
