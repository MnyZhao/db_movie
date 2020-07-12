import 'package:dbmovie/net/dio/dio_manager.dart';
import 'package:dbmovie/net/model/base/base_response.dart';
import 'package:flutter/material.dart';

import '../api.dart';

BaseResponse login(String name, String pwd) {
  DioManager.getInstance().httpRequest(Api().login,
      method: POST,
      queryParameters: {"name": name, "password": pwd}).then((value) {
    return BaseResponse.fromJson(value);
  }).catchError((e) => null);
}

Future<Map<String, dynamic>> lo(BuildContext context, String name, String pwd) {
  return DioManager.getInstance().httpRequestCallBack(context, Api().login,
      method: POST, queryParameters: {"name": name, "password": pwd});
}

BaseResponse register(String name, String pwd) {
  DioManager.getInstance().httpRequest(Api().register,
      method: POST,
      queryParameters: {"name": name, "password": pwd}).then((value) {
    return BaseResponse.fromJson(value);
  }).catchError((e) => null);
}
