// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingResponse _$MeetingResponseFromJson(Map<String, dynamic> json) =>
    MeetingResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: MeetingData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeetingResponseToJson(MeetingResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

MeetingData _$MeetingDataFromJson(Map<String, dynamic> json) => MeetingData(
  meeting: Meeting.fromJson(json['meeting'] as Map<String, dynamic>),
  attendee: Attendee.fromJson(json['attendee'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MeetingDataToJson(MeetingData instance) =>
    <String, dynamic>{
      'meeting': instance.meeting,
      'attendee': instance.attendee,
    };
