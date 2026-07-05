import 'package:json_annotation/json_annotation.dart';

import 'media_placement.dart';

part 'meeting.g.dart';

@JsonSerializable(explicitToJson: true)
class Meeting {
  @JsonKey(name: "MeetingId")
  final String meetingId;

  @JsonKey(name: "ExternalMeetingId")
  final String? externalMeetingId;

  @JsonKey(name: "MediaRegion")
  final String? mediaRegion;

  @JsonKey(name: "MediaPlacement")
  final MediaPlacement mediaPlacement;

  @JsonKey(name: "MeetingArn")
  final String? meetingArn;

  Meeting({
    required this.meetingId,
    this.externalMeetingId,
    this.mediaRegion,
    required this.mediaPlacement,
    this.meetingArn,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) =>
      _$MeetingFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingToJson(this);
}