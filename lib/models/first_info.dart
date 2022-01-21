import 'package:json_annotation/json_annotation.dart';

part 'first_info.g.dart';

@JsonSerializable()
class FirstInfo {
  String id;
  String email;
  String avatar;
  String name;
  String country;
  FirstInfo({this.id = "", this.email = "", this.avatar = "", this.name = "", this.country = ""});
  factory FirstInfo.fromJson(Map<String, dynamic> json) =>
      _$FirstInfoFromJson(json);
  Map<String, dynamic> toJson() => _$FirstInfoToJson(this);
}