import 'package:dio/dio.dart';
import 'package:garden_of_eve/common/controllers/auth_controller.dart';
import 'package:garden_of_eve/common/controllers/user_data_controller.dart';
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
            //print('Access Token: ${_userData.accessToken}');
            return handler.next(options);
          },
          onResponse: (response, handler) async {
            if (response.data['message'] == "Invalid Token") {
              if (await _userData.storage.containsKey(key: 'refreshToken')) {
                if (await refreshToken()) {
                  return handler.resolve(await _retry(response.requestOptions));
                } else {
                  final AuthController _auth = getx.Get.find();
                  print('signout na kay mali refresh pod');
                  await _auth.signOut();
                  return handler.next(response);
                }
              }
            }
            return handler.next(response);
          },
          // onError: (error, handler) async {
          //   print('nasulod sa on error');
          //   if (error.response?.statusCode == 401 &&
          //       error.response?.data['message'] == "Invalid Token") {
          //     print(error.response?.data['message']);
          //     if (await _userData.storage.containsKey(key: 'refreshToken')) {
          //       await refreshToken();
          //       return handler.resolve(await _retry(error.requestOptions));
          //     }
          //   }
          //   return handler.next(error);
          // },
        ),
      );
  }

  Future<bool> refreshToken() async {
    final _refreshToken = await _userData.storage.read(key: 'refreshToken');
    try {
      final Response response = await post(
        'token',
        data: {
          "user_id": 3, //_userData.currentUserId,
          "token": _refreshToken,
        },
      );
      if (response.statusCode == 200) {
        await _userData.storage.write(
          key: 'accessToken',
          value: response.data['token'],
        );
        await _userData.initializeToken();
        return true;
      } else {
        _userData.accessToken = null;
        _userData.storage.deleteAll();
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
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
