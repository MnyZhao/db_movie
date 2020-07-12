import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'user_id')
  int userId;

  @JsonKey(name: 'movie_id')
  String movieId;

  @JsonKey(name: 'date_time')
  String dateTime;

  @JsonKey(name: 'movie_pic')
  String moviePic;

  @JsonKey(name: 'movie_title')
  String movieTitle;

  @JsonKey(name: 'movie_quote')
  String movieQuote;

  Collection(
      {this.id,
      this.userId,
      this.movieId,
      this.dateTime,
      this.moviePic,
      this.movieTitle,
      this.movieQuote});

  factory Collection.fromJson(Map<String, dynamic> srcJson) =>
      _$CollectionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
