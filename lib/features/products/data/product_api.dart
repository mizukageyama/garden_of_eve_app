import 'dart:io';

import 'package:dio/dio.dart';
import 'package:garden_of_eve/utils/dio_network/dio_client.dart';

class ProductApi {
  final DioClient dioClient = DioClient();

  Future<Response> getProductsByCategory(int page, String category) async {
    try {
      final Response response = await dioClient.get(
        'products/by_category?page=$page&limit=5&category_key=$category',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getProducts(int page, String searchKey) async {
    try {
      String filterProduct = '';
      if (searchKey != '') {
        filterProduct = '&search_key=$searchKey';
      }

      final Response response = await dioClient.get(
        'products?page=$page$filterProduct',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getCategories() async {
    try {
      final Response response = await dioClient.get(
        '/categories',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> addProduct(productData) async {
    try {
      final Response response = await dioClient.post(
        '/products',
        data: productData,
        options: Options(
          headers: {
            HttpHeaders.acceptHeader: "json/application/json",
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
