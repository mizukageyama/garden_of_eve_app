import 'dart:io';
import 'package:flutter/material.dart';
import 'package:garden_of_eve/common/services/validator.dart';
import 'package:garden_of_eve/common/widgets/_common_widgets.dart';
import 'package:garden_of_eve/common/widgets/custom_appbar.dart';
import 'package:garden_of_eve/common/widgets/custom_text_field.dart';
import 'package:garden_of_eve/constants/_constants.dart';
import 'package:garden_of_eve/features/products/presentation/add_product/add_product_controller.dart';
import 'package:garden_of_eve/features/products/presentation/add_product/preview_product_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({Key? key}) : super(key: key);
  final _addProdController = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: CustomAppBar(
          hasBackButton: true,
          backgroundColor: lightGreenColor,
          contentColor: whiteColor,
          title: 'Add Product',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => InkWell(
                    onTap: () => _addProdController.selectProductImage(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 150,
                      width: double.infinity,
                      child: _addProdController.image.value == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Icon(
                                  Icons.add_to_photos_outlined,
                                  size: 50,
                                  color: neutralGreyColor,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Select Photo',
                                  textAlign: TextAlign.center,
                                  style: quicksandBold.copyWith(
                                    color: neutralGreyColor,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            )
                          : Image.file(
                              File(_addProdController.image.value!.path),
                              width: 140,
                              height: 140,
                              fit: BoxFit.fitHeight,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Text(
                                    'Could not load image',
                                    textAlign: TextAlign.center,
                                    style: quicksandMedium.copyWith(
                                      color: neutralGreyColor,
                                      fontSize: 13.5,
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _addProdController.addProdForm,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                        controller: _addProdController.apTitle,
                        labelText: 'Title',
                        floatLabel: true,
                        validator: Validator().notEmpty,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _addProdController.apdescription,
                        labelText: 'Description',
                        floatLabel: true,
                        validator: Validator().notEmpty,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                        key: _addProdController.categoryKey,
                        validator: (value) {
                          if (value == null) {
                            return 'This is a required field';
                          }
                          return null;
                        },
                        items: <String>['Indoor', 'Outdoor', 'Cactus']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: quicksandSemiBold.copyWith(
                                color: darkGreyColor,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          labelText: 'Categories',
                          labelStyle: quicksandRegular.copyWith(fontSize: 14),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          filled: true,
                          fillColor: whiteColor,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: neutralGreyColor,
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
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _addProdController.apSunlight,
                              labelText: 'Sunlight',
                              floatLabel: true,
                              borderRadius: BorderRadius.circular(10),
                              validator: Validator().notEmpty,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: _addProdController.apWatering,
                              labelText: 'Watering',
                              floatLabel: true,
                              keyboardType: TextInputType.phone,
                              validator: Validator().notEmpty,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _addProdController.apLifespan,
                              labelText: 'Lifespan',
                              floatLabel: true,
                              borderRadius: BorderRadius.circular(10),
                              validator: Validator().notEmpty,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: _addProdController.apSize,
                              labelText: 'Size',
                              floatLabel: true,
                              keyboardType: TextInputType.phone,
                              validator: Validator().notEmpty,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _addProdController.apQuantity,
                              labelText: 'Quantity',
                              floatLabel: true,
                              borderRadius: BorderRadius.circular(10),
                              keyboardType: TextInputType.number,
                              validator: Validator().notEmpty,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: _addProdController.apPrice,
                              labelText: 'Price',
                              floatLabel: true,
                              keyboardType: TextInputType.number,
                              validator: Validator().notEmpty,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => _addProdController.preview(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bgColor,
                        ),
                        child: Text(
                          'Preview',
                          style: quicksandMedium.copyWith(
                            color: darkGreyColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _addProdController.addProduct();
                      },
                      child: GradientContainer(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 30,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        child: Text(
                          'Post Product',
                          style: quicksandSemiBold.copyWith(
                            color: whiteColor,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
