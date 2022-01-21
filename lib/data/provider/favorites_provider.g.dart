// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesProvider _$FavoritesProviderFromJson(Map<String, dynamic> json) =>
    FavoritesProvider(
      favoriteTutor: (json['favoriteTutor'] as List<dynamic>?)
          ?.map((e) => FavoriteTutor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavoritesProviderToJson(FavoritesProvider instance) =>
    <String, dynamic>{
      'favoriteTutor': instance.favoriteTutor,
    };
