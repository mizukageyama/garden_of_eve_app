import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/utils/utils.dart';

class CustomDropdown2 extends StatefulWidget {
  const CustomDropdown2({
    Key? key,
    required this.hintText,
    required this.dropdownItems,
    GlobalKey<FormFieldState>? dpKey,
    this.onChanged,
    this.floatLabel = true,
    this.validator,
  })  : _key = dpKey,
        super(key: key);

  final String hintText;
  final List<String> dropdownItems;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool floatLabel;
  final GlobalKey<FormFieldState>? _key;

  @override
  State<CustomDropdown2> createState() => _CustomDropdown2State();
}

class _CustomDropdown2State extends State<CustomDropdown2> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      key: widget._key,
      dropdownMaxHeight: 300,
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: quicksandRegular.copyWith(fontSize: 14),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        filled: true,
        fillColor: whiteColor,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: neutralGreyColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelBehavior:
            widget.floatLabel ? FloatingLabelBehavior.auto : null,
      ),
      isExpanded: true,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      iconSize: 30,
      buttonHeight: kIsWeb ? 56 : 48,
      items: widget.dropdownItems
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: quicksandSemiBold.copyWith(
                    color: darkGreyColor,
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
