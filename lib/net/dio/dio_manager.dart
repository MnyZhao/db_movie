import 'dart:convert';

import 'package:dbmovie/net/api/api.dart';
import 'package:dbmovie/net/api/api_state.dart';
import 'package:dbmovie/net/api/exception/api_exception.dart';
import 'package:dbmovie/net/api/exception/api_exceptionhelper.dart';
import 'package:dbmovie/net/model/base/base_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'interceptors/log_interceptors.dart';

/// 默认baseurls
final String RELEASE_BASE_URL = Api().baseUrl;

/// 连接超时时间
const int CONNECTION_TIMEOUT = 10 * 1000;

/// 接收超时时间
const int RECEIVER_TIMEOUT = 10 * 1000;

/// 请求方式 GET
const String GET = 'get';

/// 请求方式 POST
const String POST = 'post';

/// 请求方式 PUT
const String PUT = 'put';

/// 请求方式 PATCH
const String PATCH = 'patch';

/// 请求方式 DELETE
const String DELETE = 'delete';

/// 支持baseurl切换 默认为[RELEASE_BASE_URL]
class DioManager {
  // 当网络请求失败 有可能需要跳转到新路由界面 比如 token失效
  static DioManager _instance = DioManager._internal();

  /// 工厂模式创建DioManager对象
  factory DioManager() => _instance;

  /// [_dio] Dio 请求对象
  Dio _dio;

  /// [baseUrl] 表示基础的Url
  DioManager._internal({String baseUrl}) {
    if (null == _dio) {
      _dio = Dio(BaseOptions(
          baseUrl: baseUrl ?? RELEASE_BASE_URL,
          connectTimeout: CONNECTION_TIMEOUT,
          receiveTimeout: RECEIVER_TIMEOUT,
          headers: {"content-type": "application/json;charset=UTF-8"}));
      _dio.interceptors.add(LogInterceptors());
    }
    _dio.options.headers.addAll({"token": "token"});
  }

  /// 获取DioManager实例
  static DioManager getInstance({String baseUrl}) {
    if (null != baseUrl) {
      return _instance._baseUrl(baseUrl: baseUrl);
    }
    return _instance._normal();
  }

  /// 默认路径设置
  DioManager _normal(
      {int connectTimeout = 10 * 1000, int receiveTimeout = 10 * 1000}) {
    if (null != _dio) {
      if (_dio.options.baseUrl != RELEASE_BASE_URL) {
        _dio.options.baseUrl = RELEASE_BASE_URL;
      }
    }
    return _instance;
  }

  /// 指定baseurl设置
  DioManager _baseUrl({String baseUrl}) {
    if (null != _dio) {
      _dio.options.baseUrl = baseUrl;
    }
    return _instance;
  }

  /// 可以传入onSuccess onError 回调 来获取 请求结果
  ///[url] 请求地址
  ///[method] 请求类型  不传递 默认为get
  ///[queryParameters] 参数map 不传递 则为空map
  ///[onSuccess] 请求成功回调
  ///[onError] 请求失败回调String
  ///[cancelToken] 可以通过cancelToken 取消请求 一个cancelToken 可以对应多个请求
  ///当该cancelToken 取消时 对应的所有请求均被取消
  Future<Map<String, dynamic>> httpRequestCallBack<T>(BuildContext context,
      String url,
      {String method,
        Map<String, dynamic> queryParameters,
        Function(T t) onSuccess,
        Function(Exception error) onError,
        CancelToken cancelToken}) async {
    //默认为get请求
    method = method ?? 'GET';
    //当参数为空声明空集合
    queryParameters = queryParameters ?? {};
    var jsonstr;
    try {
      Response response = await _instance._dio.request(url,
          data: method == 'GET' ? null : queryParameters,
          queryParameters: method == 'GET' ? queryParameters : null,
          cancelToken: cancelToken,
          options: checkOptions(method, Options()));
      if (response.statusCode == 200) {
        // 转换为Map
        jsonstr = json.decode(response.toString());
        var base = BaseResponse.fromJson(jsonstr);
        if (base.code != ApiStateCode.stateSuccess || !base.success) {
          jsonstr = null;
          throw ApiException(errorState: base.code, errorMsg: base.msg);
        }
        if (null != onSuccess) {
          onSuccess(jsonstr);
        }
      } else {
        throw ApiException(
            errorState: response.statusCode, errorMsg: response.statusMessage);
      }
    } on Exception catch (e) {
      // 所有的错误处理都丢到这里进行
      ApiExceptionHelper(context).exceptionHelper(e);
      if (null != onError) {
        onError(e);
      }
    }
    return jsonstr;
  }

  /// 返回Map<String,dynamic>方便解析 通过then 取得结果 catchError 获取错误
  Future<Map<String, dynamic>> httpRequest(String url,
      {String method,
        Map<String, dynamic> queryParameters,
        CancelToken cancelToken}) async {
    //默认为get请求
    method = method ?? 'GET';
    //当参数为空声明空集合
    queryParameters = queryParameters ?? {};
    var jsonstr;
    Response response = await _instance._dio.request(url,
        data: method == 'GET' ? null : queryParameters,
        queryParameters: method == 'GET' ? queryParameters : null,
        options: checkOptions(method, Options()),
        cancelToken: cancelToken);
    if (response.statusCode == 200) {
      // 转换为Map
      jsonstr = json.decode(response.toString());
      var base = BaseResponse.fromJson(jsonstr);
      if (base.code != ApiStateCode.stateSuccess || !base.success) {
        jsonstr = null;
        throw ApiException(errorState: base.code, errorMsg: base.msg);
      }
    } else {
      throw ApiException(
          errorState: response.statusCode, errorMsg: response.statusMessage);
    }
    return jsonstr;
  }

  Options checkOptions(method, options) {
    options ??= Options();
    options.method = method;
    return options;
  }
}
