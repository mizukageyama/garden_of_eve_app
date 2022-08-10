import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/products/presentation/product_info/widgets/icon_info.dart';

class IconInfoRow extends StatelessWidget {
  const IconInfoRow({
    Key? key,
    required this.info,
  }) : super(key: key);

  final List<String> info;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: IconInfo(
            icon: Icons.wb_sunny_outlined,
            info: info[0],
          ),
        ),
        Expanded(
          child: IconInfo(
            icon: Icons.water_drop_outlined,
            info: info[1],
          ),
        ),
        Expanded(
          child: IconInfo(
            icon: Icons.update_rounded,
            info: info[2],
          ),
        ),
        Expanded(
          child: IconInfo(
            icon: Icons.aspect_ratio_rounded,
            info: info[3],
          ),
        ),
      ],
    );
  }
}
