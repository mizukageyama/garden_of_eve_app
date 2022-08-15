import 'package:flutter/cupertino.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/profile/domain/shipping_addr_model.dart';

class ShippingAddrTile extends StatelessWidget {
  const ShippingAddrTile({
    Key? key,
    required this.addr,
  }) : super(key: key);

  final ShippingAddr addr;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          addr.address,
          style: quicksandSemiBold.copyWith(
            fontSize: 15,
            color: darkGreyColor,
          ),
        ),
        const SizedBox(height: 1),
        Text(
          '${addr.fullName} | ${addr.contactNumber}',
          style: quicksandMedium.copyWith(
            fontSize: 14,
            color: darkGreyColor,
          ),
        ),
      ],
    );
  }
}
