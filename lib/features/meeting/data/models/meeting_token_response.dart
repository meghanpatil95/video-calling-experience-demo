import 'attendee.dart';

class MeetingTokenResponse {
  final String status;
  final String message;
  final MeetingTokenData data;

  const MeetingTokenResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MeetingTokenResponse.fromJson(Map<String, dynamic> json) {
    return MeetingTokenResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: MeetingTokenData.fromJson(json['data']),
    );
  }
}

class MeetingTokenData {
  final MeetingTokenMeeting meeting;
  final Attendee attendee;

  const MeetingTokenData({required this.meeting, required this.attendee});

  factory MeetingTokenData.fromJson(Map<String, dynamic> json) {
    return MeetingTokenData(
      meeting: MeetingTokenMeeting.fromJson(json['meeting']),
      attendee: Attendee.fromJson(json['attendee']),
    );
  }
}

class MeetingTokenMeeting {
  final String meetingId;

  const MeetingTokenMeeting({required this.meetingId});

  factory MeetingTokenMeeting.fromJson(Map<String, dynamic> json) {
    return MeetingTokenMeeting(meetingId: json['MeetingId'] ?? '');
  }
}
