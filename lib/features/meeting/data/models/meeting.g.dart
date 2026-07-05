// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meeting _$MeetingFromJson(Map<String, dynamic> json) => Meeting(
  meetingId: json['MeetingId'] as String,
  externalMeetingId: json['ExternalMeetingId'] as String?,
  mediaRegion: json['MediaRegion'] as String?,
  mediaPlacement: MediaPlacement.fromJson(
    json['MediaPlacement'] as Map<String, dynamic>,
  ),
  meetingArn: json['MeetingArn'] as String?,
);

Map<String, dynamic> _$MeetingToJson(Meeting instance) => <String, dynamic>{
  'MeetingId': instance.meetingId,
  'ExternalMeetingId': instance.externalMeetingId,
  'MediaRegion': instance.mediaRegion,
  'MediaPlacement': instance.mediaPlacement.toJson(),
  'MeetingArn': instance.meetingArn,
};
