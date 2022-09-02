import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/app_colors.dart';
import 'package:garden_of_eve/utils/utils.dart';

class LoadingListView extends StatelessWidget {
  const LoadingListView({
    Key? key,
    this.isHorizontalDirection = true,
    this.itemCount = 4,
    this.skeletonHeight,
    required this.skeleton,
  }) : super(key: key);

  final bool isHorizontalDirection;
  final int itemCount;
  final StatelessWidget skeleton;
  final double? skeletonHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isHorizontalDirection ? skeletonHeight : null,
      child: ListView.builder(
        scrollDirection:
            isHorizontalDirection ? Axis.horizontal : Axis.vertical,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: isHorizontalDirection
                  ? index == 0
                      ? 20
                      : 0
                  : 15,
              right: 15,
              top: isHorizontalDirection ? 0 : 8.0,
            ),
            child: Shimmer.fromColors(
              baseColor: inactiveGreyColor,
              highlightColor: Colors.grey.shade500,
              child: skeleton,
            ),
          );
        },
      ),
    );
  }
}
