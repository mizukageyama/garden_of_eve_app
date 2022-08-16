import 'package:flutter/material.dart';
import 'package:garden_of_eve/common_widgets/_common_widgets.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/order_list_controller.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/widgets/order_list_view.dart';
import 'package:garden_of_eve/features/orders/presentation/order_list/widgets/order_tile.dart';
import 'package:garden_of_eve/utils/utils.dart';

class OrderListScreen extends StatelessWidget {
  OrderListScreen({Key? key}) : super(key: key);
  //final MyTabController _tab = Get.put(MyTabController());
  final orderController = Get.put(OrderListController());

  @override
  Widget build(BuildContext context) {
    print('build');
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GradientContainer(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(45),
              ),
              padding: const EdgeInsets.fromLTRB(15, 15, 30, 15),
              child: Text(
                'My Orders',
                style: quicksandSemiBold.copyWith(
                  color: whiteColor,
                  fontSize: 18,
                ),
              ),
            ),
            Flexible(
              child: Obx(
                () => showOrders(),
              ),
            ),
            // Obx(
            //   () => orderController.isLoading.value
            //       ? const CircularProgressIndicator()
            //       : OrderTile(
            //           order: orderController.orders[0],
            //         ),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            // Obx(
            //   () => orderController.isLoading.value
            //       ? const CircularProgressIndicator()
            //       : OrderTile(
            //           order: orderController.orders[0],
            //         ),
            // ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget showOrders() {
    print('obx');
    if (orderController.isLoading.value) {
      return const SizedBox(
        height: 85,
        child: Center(
          child: Text(
            'Loading...',
          ),
        ),
      );
    }
    if (orderController.orders.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }

    return OrderListView();
  }
}


//TO DO: change this for categories on home screen
// Container(
//               //color: whiteColor,
//               height: 40,
//               child: TabBar(
//                 indicatorColor: greenColor,
//                 labelStyle: quicksandSemiBold.copyWith(
//                   fontSize: 15,
//                 ),
//                 unselectedLabelStyle: quicksandMedium.copyWith(
//                   fontSize: 14,
//                 ),
//                 labelColor: greenColor,
//                 unselectedLabelColor: greyColor,
//                 isScrollable: true,
//                 // indicator: const BoxDecoration(
//                 //   color: greenColor,
//                 //   borderRadius: BorderRadius.only(
//                 //     topLeft: Radius.circular(15),
//                 //     topRight: Radius.circular(15),
//                 //   ),
//                 // ),
//                 controller: _tab.controller,
//                 tabs: _tab.tabs,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Flexible(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   color: whiteColor,
//                   //height: 300,
//                   width: double.maxFinite,
//                   child: TabBarView(
//                     controller: _tab.controller,
//                     children: [
//                       Text('data 1'),
//                       Text('data 2'),
//                       Text('data 3'),
//                       Text('data 4'),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
