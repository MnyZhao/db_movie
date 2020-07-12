import 'package:dbmovie/net/model/base/base_response.dart';
import 'package:dbmovie/net/model/resp/collection.dart';
import 'package:json_annotation/json_annotation.dart';
part 'collection_list.g.dart';
@JsonSerializable()
class CollectionList extends BaseResponse {
  @JsonKey(name: "data")
  List<Collection> data;

  CollectionList(this.data);

  factory CollectionList.fromJson(Map<String, dynamic> data) =>
      _$CollectionListFromJson(data);

  Map<String, dynamic> toJson() => _$CollectionListToJson(this);
}
