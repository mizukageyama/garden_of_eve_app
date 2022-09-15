import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/utils/utils.dart';

class LoadingGridView extends StatelessWidget {
  const LoadingGridView({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.itemCount = 10,
    required this.skeleton,
    required this.widthPerTile,
  }) : super(key: key);

  final Axis scrollDirection;
  final int itemCount;
  final StatelessWidget skeleton;
  final double widthPerTile;

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 15,
      maxCrossAxisExtent: widthPerTile,
      mainAxisSpacing: 15,
      children: List.generate(
        itemCount,
        (index) {
          return Shimmer.fromColors(
            baseColor: inactiveGreyColor,
            highlightColor: Colors.grey.shade500,
            child: skeleton,
          );
        },
      ),
    );
  }
}
