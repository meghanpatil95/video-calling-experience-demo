// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendee _$AttendeeFromJson(Map<String, dynamic> json) => Attendee(
  attendeeId: json['AttendeeId'] as String,
  joinToken: json['JoinToken'] as String,
  externalUserId: json['ExternalUserId'] as String,
);

Map<String, dynamic> _$AttendeeToJson(Attendee instance) => <String, dynamic>{
  'AttendeeId': instance.attendeeId,
  'JoinToken': instance.joinToken,
  'ExternalUserId': instance.externalUserId,
};
