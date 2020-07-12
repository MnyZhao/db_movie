import 'package:dbmovie/net/model/base/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_movie.g.dart';

@JsonSerializable()
class ListMovie extends BaseResponse {
  @JsonKey(name: 'Movie')
  List<Movie> data;

  ListMovie(
    this.data,
  );

  factory ListMovie.fromJson(Map<String, dynamic> srcJson) =>
      _$ListMovieFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ListMovieToJson(this);
}

@JsonSerializable()
class Movie extends Object {
  @JsonKey(name: 'Id')
  int id;

  @JsonKey(name: 'MId')
  String mId;

  @JsonKey(name: 'MPic')
  String mPic;

  @JsonKey(name: 'MovieUrl')
  String movieUrl;

  @JsonKey(name: 'MTitleC')
  String mTitleC;

  @JsonKey(name: 'MTitleE')
  String mTitleE;

  @JsonKey(name: 'MTitleOther')
  String mTitleOther;

  @JsonKey(name: 'MCast')
  String mCast;

  @JsonKey(name: 'MQuote')
  String mQuote;

  @JsonKey(name: 'Score')
  String score;

  @JsonKey(name: 'Evaluate')
  String evaluate;

  Movie(
    this.id,
    this.mId,
    this.mPic,
    this.movieUrl,
    this.mTitleC,
    this.mTitleE,
    this.mTitleOther,
    this.mCast,
    this.mQuote,
    this.score,
    this.evaluate,
  );

  factory Movie.fromJson(Map<String, dynamic> srcJson) =>
      _$MovieFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
