import 'package:dbmovie/net/model/resp/movieinfo.dart';
import 'package:flutter/material.dart';

import 'widget/widget_utils.dart';

class MovieDetails extends StatelessWidget {
  int id;
  MovieDetails({this.id});
  MovieInfo movieInfo;
  @override
  Widget build(BuildContext context) {
    movieInfo=MovieInfo();
    return Scaffold(
      appBar: getAppBar(""),
    );
  }

}
