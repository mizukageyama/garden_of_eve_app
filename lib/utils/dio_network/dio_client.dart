import 'package:dio/dio.dart';
import 'package:garden_of_eve/common/controllers/user_data_controller.dart';
import 'package:garden_of_eve/constants/api_key_holder.dart';
import 'package:garden_of_eve/constants/endpoints.dart';
import 'package:get/get.dart' as getx;

class DioClient {
  final UserData _userData = getx.Get.find();
  final Dio _dio = Dio();

  DioClient() {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            options.headers = {
              "content-type": "application/json",
              "authorization": "Bearer ${_userData.accessToken}"
            };
            return handler.next(options);
          },
          onError: (error, handler) async {
            if (error.response?.statusCode == 401 &&
                error.response?.data['message'] == "Invalid Token") {
              print(error.response?.data['message']);
              if (await _userData.storage.containsKey(key: 'refreshToken')) {
                await refreshToken();
              }
            }
          },
        ),
      );
  }

  Future<void> refreshToken() async {
    final _refreshToken = await _userData.storage.read(key: 'refreshToken');
    final response = await post(
      'token',
      data: {
        "user_id": _userData.currentUserId,
        "token": _refreshToken,
      },
    );
    if (response.statusCode == 200) {
      _userData.accessToken = response.data['token'];
    } else {
      _userData.accessToken = null;
      _userData.storage.deleteAll();
      print('signout user');
    }
  }

  //GET
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //POST
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //PATCH
  Future<Response> patch(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //DELETE
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
