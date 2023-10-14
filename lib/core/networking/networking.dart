import 'dart:convert';

import 'package:cube/auth/secrets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Networking {
  Networking._();

  static final Networking instance = Networking._();

  final _dio = Dio(BaseOptions(
      // baseUrl: 'https://connect.squareupsandbox.com/v2/',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      // headers: {
      //   'Square-Version': '2023-09-25',
      //   'Authorization' : Secrets.squareAPIKey,
      //   'Content-Type': 'application/json'
      // }
      ));

  Future<T?> getRequest<T extends BaseModel>(
      {required String path, required Map<String, dynamic> params,required T type}) async {
      Response response = await _dio.get(path, queryParameters: params);
      if (response.statusCode == 200) {
        debugPrint('getRequest response is $response');
        return type.fromJson(response.data);
      }
  }

  Future<Response?> postRequest(
      {required String path, required Map<String, dynamic> body,Map<String,dynamic>? params, Map<String,dynamic>? headers}) async {
    Response response = await _dio.post(path, data: body,queryParameters: params,options: Options(headers: headers));
    return response;
  }
}


abstract class BaseModel<T> {
  @factory
  T fromJson(Map<String,dynamic> json);

}
