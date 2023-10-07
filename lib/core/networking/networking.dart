import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Networking {
  Networking._();

  static final Networking instance = Networking._();

  final _dio = Dio(BaseOptions(
      baseUrl: 'https://connect.squareupsandbox.com/v2/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Square-Version': '2023-09-25',
        'Authorization':
            'Bearer EAAAEE0Vl4dTGw0exoIwB7Ttq92t50QkdGXkFE_r80rcfmMJIHEkJajpwWHLMTkj',
        'Content-Type': 'application/json'
      }));

  Future<T?> getRequest<T extends BaseModel>(
      {required String path, required Map<String, dynamic> params,required T type}) async {
      Response response = await _dio.get(path, queryParameters: params);
      if (response.statusCode == 200) {
        debugPrint('getRequest response is $response');
        return type.fromJson(response.data);
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


abstract class BaseModel<T> {
  @factory
  T fromJson(Map<String,dynamic> json);

}
