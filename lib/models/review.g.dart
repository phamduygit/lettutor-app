// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['id'] as String? ?? "",
      bookingId: json['bookingId'] as String? ?? "",
      content: json['content'] as String? ?? "",
      rating: json['rating'] as int? ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      firstInfo: json['firstInfo'] == null
          ? null
          : FirstInfo.fromJson(json['firstInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'content': instance.content,
      'rating': instance.rating,
      'createdAt': instance.createdAt?.toIso8601String(),
      'firstInfo': instance.firstInfo,
    };
