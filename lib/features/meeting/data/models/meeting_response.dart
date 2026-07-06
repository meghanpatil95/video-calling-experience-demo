import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'attendee.dart';
import 'meeting.dart';

part 'meeting_response.g.dart';

@JsonSerializable()
class MeetingResponse {

  final String status;

  final String message;

  final MeetingData data;

  MeetingResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MeetingResponse.fromJson(Map<String, dynamic> json) {
    debugPrint("json :: $json");
    return _$MeetingResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MeetingResponseToJson(this);
}

@JsonSerializable()
class MeetingData {

  final Meeting meeting;

  final Attendee attendee;

  MeetingData({
    required this.meeting,
    required this.attendee,
  });

  factory MeetingData.fromJson(Map<String, dynamic> json) =>
      _$MeetingDataFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingDataToJson(this);
}