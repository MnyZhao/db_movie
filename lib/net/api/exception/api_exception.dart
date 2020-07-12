import 'package:flutter/material.dart';

class ApiException implements Exception {
  int errorState;
  String errorMsg;

  ApiException({this.errorState, this.errorMsg});

  @override
  String toString() {
    // TODO: implement toString
    return "errorState:${this.errorState},ErrorMessage:${this.errorMsg}";
  }
}
