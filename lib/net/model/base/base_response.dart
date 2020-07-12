class BaseResponse {
  bool success;

  String msg;

  int code;

  BaseResponse({this.success, this.msg, this.code});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        success: json['success'] as bool,
        msg: json['msg'] as String,
        code: json['code'] as int
    );
  }
}
