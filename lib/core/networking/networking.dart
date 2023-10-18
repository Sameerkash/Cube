import 'dart:convert';

import 'package:cube/auth/secrets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Networking {
  Networking._();

  static final Networking instance = Networking._();

  final _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      ));

  static Map<String,dynamic> squareHeaders = {
    'Square-Version': '2023-09-25',
    'Authorization' : Secrets.squareAPIKey,
    'Content-Type': 'application/json'
  };

  static Map<String,dynamic> squareHeadersForImage = {
    'Square-Version': '2021-12-14',
    'Authorization' : Secrets.squareAPIKey,
    'Content-Type': 'application/json'
  };

  Future<T?> getRequest<T extends BaseModel>(
      {required String path, required Map<String, dynamic> params,required T type, Map<String,dynamic>? headers}) async {
      Response response = await _dio.get(path, queryParameters: params,options: Options(headers: headers));
      if (response.statusCode == 200) {
        debugPrint('getRequest response is $response');
        return type.fromJson(response.data);
      }
  }

  Future<Response?> postRequest(
      {required String path, required dynamic body,Map<String,dynamic>? params,required Map<String,dynamic>? headers}) async {
    try {
      Response response = await _dio.post(path, data: body,
          queryParameters: params,
          options: Options(headers: headers));
      if(response.statusCode != 200) {
        print("postRequest error is ${response.data}");
      }
      return response;
    }catch(e) {
      print("postRequest error is $e");
    }
  }
}


abstract class BaseModel<T> {
  @factory
  T fromJson(Map<String,dynamic> json);

}
