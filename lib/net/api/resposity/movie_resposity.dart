import 'package:dbmovie/net/dio/dio_manager.dart';
import 'package:dbmovie/net/model/resp/list_movie.dart';
import 'package:flutter/widgets.dart';

import '../api.dart';

Future<Map<String, dynamic>> loadMovies(String type, int page, int pageSize) {
  Map<String, dynamic> params = {
    "page": page,
    "pageSize": pageSize,
    "type": type,
  };
  return DioManager.getInstance()
      .httpRequest(Api().movie, queryParameters: params);
}
