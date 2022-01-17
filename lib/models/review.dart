import 'package:lettutor_app/models/firstInfo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  String id;
  String bookingId;
  String content;
  int rating;
  DateTime? createdAt;
  FirstInfo? firstInfo;
  Review({
    this.id = "",
    this.bookingId = "",
    this.content = "",
    this.rating = 0,
    this.createdAt,
    this.firstInfo,
  });
    factory Review.fromJson(Map<String, dynamic> json) =>
      _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
