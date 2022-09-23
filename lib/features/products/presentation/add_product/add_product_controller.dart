import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/features/products/presentation/add_product/preview_product_screen.dart';
import 'package:garden_of_eve/utils/utils.dart';

class AddProductController extends GetxController {
  final addProdForm = GlobalKey<FormState>();
  final categoryKey = GlobalKey<FormFieldState>();

  final ImagePicker _picker = ImagePicker();
  final Rxn<XFile?> image = Rxn<XFile?>();

  final apTitle = TextEditingController();
  final apdescription = TextEditingController();
  final List<int> apCategory = List.empty(growable: true);
  final apSunlight = TextEditingController();
  final apWatering = TextEditingController();
  final apLifespan = TextEditingController();
  final apSize = TextEditingController();
  final apQuantity = TextEditingController();
  final apPrice = TextEditingController();

  Future<void> selectProductImage() async {
    final XFile? selectedImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (selectedImage == null) return;
    image.value = selectedImage;
  }

  Product get fromInput => Product(
        id: 0,
        name: apTitle.text,
        description: apdescription.text,
        sunlight: apSunlight.text,
        watering: apWatering.text,
        lifespan: apLifespan.text,
        size: apSize.text,
        category: List.empty(),
        qty: int.parse(apQuantity.text),
        price: double.parse(apPrice.text),
        imgDirectory: image.value?.path ?? '',
        imgUrl: image.value?.path ?? '',
        imgCredit: 'From User',
        createdAt: DateTime.now(),
        modifiedAt: DateTime.now(),
        discount: null,
        favId: null,
      );

  void addProduct() {
    if (validateInput()) {
      print('api post');
    }
    return;
  }

  bool validateInput() {
    if (addProdForm.currentState!.validate() &&
        categoryKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  void preview() {
    if (validateInput()) {
      Get.to(
        () => PreviewScreen(
          product: fromInput,
        ),
      );
    }
    return;
  }
}
