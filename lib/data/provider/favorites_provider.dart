import 'package:lettutor_app/models/favorite_tutor.dart';

import 'package:json_annotation/json_annotation.dart';

part 'favorites_provider.g.dart';

@JsonSerializable()
class FavoritesProvider {
  List<FavoriteTutor>? favoriteTutor;
  FavoritesProvider({this.favoriteTutor});
  factory FavoritesProvider.fromJson(Map<String, dynamic> json) =>
      _$FavoritesProviderFromJson(json);
  Map<String, dynamic> toJson() => _$FavoritesProviderToJson(this);
}
