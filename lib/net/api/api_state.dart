class ApiStateCode {
  ///建立连接成功
  static const int success = 200;

  ///请求成功
  static const int stateSuccess = 90000;

  ///请求失败
  static const int stateError = 10000;

  ///参数为空
  static const int stateParamsNIl = 10001;

  ///参数错误
  static const int stateParamsError = 10002;

  ///数据不存在 例如用户名不存在
  static const int stateDateNil = 10003;

  ///数据库查询失败
  static const int stateQueryError = 10004;

  ///token 失效
  static const int stateTokenInvalid = 10005;
}
