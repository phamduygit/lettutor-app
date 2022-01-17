import 'package:json_annotation/json_annotation.dart';

part 'firstInfo.g.dart';

@JsonSerializable()
class FirstInfo {
  String email;
  String avatar;
  String name;
  String country;
  FirstInfo({this.email = "", this.avatar = "", this.name = "", this.country = ""});
  factory FirstInfo.fromJson(Map<String, dynamic> json) =>
      _$FirstInfoFromJson(json);
  Map<String, dynamic> toJson() => _$FirstInfoToJson(this);
}