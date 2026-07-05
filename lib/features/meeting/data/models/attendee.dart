import 'package:json_annotation/json_annotation.dart';

part 'attendee.g.dart';

@JsonSerializable()
class Attendee {

  @JsonKey(name: "AttendeeId")
  final String attendeeId;

  @JsonKey(name: "JoinToken")
  final String joinToken;

  @JsonKey(name: "ExternalUserId")
  final String externalUserId;

  Attendee({
    required this.attendeeId,
    required this.joinToken,
    required this.externalUserId,
  });

  factory Attendee.fromJson(Map<String, dynamic> json) =>
      _$AttendeeFromJson(json);

  Map<String, dynamic> toJson() => _$AttendeeToJson(this);
}