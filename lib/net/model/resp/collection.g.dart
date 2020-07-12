// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) {
  return Collection(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      movieId: json['movie_id'] as String,
      dateTime: json['date_time'] as String,
      moviePic: json['movie_pic'] as String,
      movieTitle: json['movie_title'] as String,
      movieQuote: json['movie_quote'] as String);
}

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'movie_id': instance.movieId,
      'date_time': instance.dateTime,
      'movie_pic': instance.moviePic,
      'movie_title': instance.movieTitle,
      'movie_quote': instance.movieQuote
    };
