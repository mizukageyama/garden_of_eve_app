import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/products/data/product_repository.dart';
import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/features/products/presentation/add_product/preview_product_screen.dart';
import 'package:garden_of_eve/utils/dialogs.dart';
import 'package:garden_of_eve/utils/utils.dart';

class AddProductController extends GetxController {
  final ProductRepository _prodRepo = ProductRepository();

  final addProdForm = GlobalKey<FormState>();
  final categoryKey = GlobalKey<FormFieldState>();

  final ImagePicker _picker = ImagePicker();
  final Rxn<XFile?> image = Rxn<XFile?>();

  final apTitle = TextEditingController(text: 'Aaa Plant');
  final apdescription = TextEditingController(text: 'Sample Description');
  final List<int> apCategory = [1, 2];
  final apSunlight = TextEditingController(text: 'Direct');
  final apWatering = TextEditingController(text: 'Once a day');
  final apLifespan = TextEditingController(text: '2 years');
  final apSize = TextEditingController(text: '2 ft.');
  final apQuantity = TextEditingController(text: '2');
  final apPrice = TextEditingController(text: '200');

  //Getter and Setters
  bool get hasPhotoSelected => image.value != null;

  XFile get selectedPhoto => image.value!;

  Future<void> selectProductImage() async {
    final XFile? selectedImage = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    if (selectedImage == null) return;
    image.value = selectedImage;
  }

  bool get validateInput =>
      addProdForm.currentState!.validate() &&
      categoryKey.currentState!.validate() &&
      hasPhotoSelected;

  Map<String, dynamic> get prodData => {
        "name": apTitle.text,
        "description": apdescription.text,
        "sunlight": apSunlight.text,
        "watering": apWatering.text,
        "lifespan": apLifespan.text,
        "size": apSize.text,
        "qty": int.parse(apQuantity.text),
        "price": double.parse(apPrice.text),
        "categories": apCategory,
        "img_credit": "Photo from desktop"
      };

  //Function: Go to Preview Screen
  void goToPreviewScreen() {
    if (!validateInput) {
      return;
    }

    Get.to(
      () => PreviewScreen(
        product: Product.fromJson(prodData),
      ),
    );
  }

  //Function: Add Product
  Future<void> addProduct() async {
    if (!validateInput) {
      return;
    }

    final fileImage = File(image.value!.path);
    String fileName = fileImage.path.split('/').last;

    final formData = FormData.fromMap({
      'product_data': json.encode(prodData),
      'image': await MultipartFile.fromFile(
        fileImage.path,
        filename: fileName,
        contentType: MediaType("image", "jpeg"),
      )
    });

    Map<String, dynamic> message = await _prodRepo.addNewProduct(formData);

    bool success = message['success'] == 1;
    if (success) {
      //TO DO: go back to home screen I guess?
      clearInput();
    }
    showSnackBar(
      title: success ? 'Success' : 'Failed',
      message: message['message'],
    );
  }

  //Function: Clear Input Data
  void clearInput() {
    apTitle.clear();
    apdescription.clear();
    apSunlight.clear();
    apWatering.clear();
    apLifespan.clear();
    apSize.clear();
    apQuantity.clear();
    apPrice.clear();
    apCategory.clear();
    image.value = null;
  }
}
