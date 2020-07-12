import 'package:dio/dio.dart';

class LogInterceptors extends Interceptor {
  @override
  onRequest(RequestOptions options) async {
    print("method = ${options.method.toString()}");
    print("url = ${options.uri.toString()}");
    print("headers = ${options.headers}");
    print("params = ${options.queryParameters}");
    print("data ${options.data}");
    print("content_type = ${options.contentType}");

    return options;
  }

  @override
  onResponse(Response response) async {
    if (response != null) {
      print("response.stateCode = ${response.statusCode}");
      print("response.statusMessage = ${response.statusMessage}");
      print("response.data = ${response.toString()}");
    }
    return response; // continue
  }

  @override
  onError(DioError err) async {
    print('请求异常: ' + err.toString());
    return err;
  }
}
