import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Networking {
  Networking._();

  static final Networking instance = Networking._();

  final _dio = Dio(BaseOptions(
      baseUrl: 'https://connect.squareupsandbox.com/v2/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Square-Version': '2023-09-25',
        'Authorization':
            'Bearer EAAAEE0Vl4dTGw0exoIwB7Ttq92t50QkdGXkFE_r80rcfmMJIHEkJajpwWHLMTkj',
        'Content-Type': 'application/json'
      }));

  Future<dynamic> getRequest(
      {required String path, required Map<String, dynamic> params}) async {
    Response response = await _dio.get(path, queryParameters: params);
    if (response.statusCode == 200) {
      debugPrint('getRequest response is $response');
      return response.data;
    }
  }

  Future<void> postRequest(
      {required String path, required Map<String, dynamic> body}) async {
    Response response = await _dio.post(path, data: body);
    if (response.statusCode == 200) {
      debugPrint('postRequest response is $response');
    }
  }
}
