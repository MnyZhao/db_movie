// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMovie _$ListMovieFromJson(Map<String, dynamic> json) {
  return ListMovie((json['data'] as List)
      ?.map((e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
      ?.toList())
    ..success = json['success'] as bool
    ..msg = json['msg'] as String
    ..code = json['code'] as int;
}

Map<String, dynamic> _$ListMovieToJson(ListMovie instance) => <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'code': instance.code,
      'Movie': instance.data
    };

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
      json['Id'] as int,
      json['MId'] as String,
      json['MPic'] as String,
      json['MovieUrl'] as String,
      json['MTitleC'] as String,
      json['MTitleE'] as String,
      json['MTitleOther'] as String,
      json['MCast'] as String,
      json['MQuote'] as String,
      json['Score'] as String,
      json['Evaluate'] as String);
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'Id': instance.id,
      'MId': instance.mId,
      'MPic': instance.mPic,
      'MovieUrl': instance.movieUrl,
      'MTitleC': instance.mTitleC,
      'MTitleE': instance.mTitleE,
      'MTitleOther': instance.mTitleOther,
      'MCast': instance.mCast,
      'MQuote': instance.mQuote,
      'Score': instance.score,
      'Evaluate': instance.evaluate
    };
