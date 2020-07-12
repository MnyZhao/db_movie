class Api {
  String baseUrl = "http://192.168.137.1:8080";

  ///login POST
  String login = "/user/login";

  ///register POST
  String register = "/user/register";

  ///changepwd  POST
  String changePwd = "/user/change-pwd";

  /// 删除用户 DELETE
  String deleteUser = "/user/delete-user";

  ///getMovieList GET
  String movie = "/movie/movies";

  ///getMovieInfo GET
  String movieInfo = "/movie/movie-info";
}
