// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionList _$CollectionListFromJson(Map<String, dynamic> json) {
  return CollectionList((json['data'] as List)
      ?.map((e) =>
          e == null ? null : Collection.fromJson(e as Map<String, dynamic>))
      ?.toList())
    ..success = json['success'] as bool
    ..msg = json['msg'] as String
    ..code = json['code'] as int;
}

Map<String, dynamic> _$CollectionListToJson(CollectionList instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data
    };
