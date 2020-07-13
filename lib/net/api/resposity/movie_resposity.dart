import 'package:dbmovie/net/dio/dio_manager.dart';
import 'package:dbmovie/net/model/base/base_response.dart';
import 'package:flutter/material.dart';

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

Future<Map<String, dynamic>> LoadMovieInfo(int id) async {
  Map<String, dynamic> params = {"movie_id": id};
  return await DioManager.getInstance()
      .httpRequest(Api().movie, queryParameters: params);
}
