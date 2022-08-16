import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/widgets/category_skeleton.dart';

class LoadingCategory extends StatelessWidget {
  const LoadingCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 20 : 0,
              right: 15,
            ),
            child: const CategorySkeleton(),
          );
        },
      ),
    );
  }
}
