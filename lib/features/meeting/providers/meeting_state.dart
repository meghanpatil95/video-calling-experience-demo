import 'package:flutter_amazon_chime/models/join_info.dart';
import 'package:video_calling_experience_demo/features/meeting/data/models/meeting_token_response.dart';

import '../data/models/meeting_event.dart';
import '../data/models/meeting_response.dart';
import '../data/models/schedule_meetings.dart';

enum MeetingLaunchType { instant, scheduled }

enum MeetingStatus { idle, joining, connected, disconnected }

class MeetingState {
  final MeetingStatus status;
  final MeetingLaunchType? launchType;
  final MeetingResponse? meeting;
  final MeetingTokenResponse? meetingTokenResp;
  final List<ScheduledMeeting> scheduledMeetings;
  final JoinInfo? joinInfo;

  final bool isMicEnabled;

  final bool isCameraEnabled;

  final List<MeetingEvent> eventLogs;
  final String? error;

  const MeetingState({
    this.status = MeetingStatus.idle,
    this.scheduledMeetings = const [],

    this.launchType,
    this.meeting,
    this.meetingTokenResp,
    this.joinInfo,
    this.isMicEnabled = true,
    this.isCameraEnabled = true,
    this.eventLogs = const [],
    this.error,
  });

  bool get isLoading => status == MeetingStatus.joining;

  MeetingState copyWith({
    MeetingStatus? status,
    MeetingLaunchType? launchType,
    MeetingResponse? meeting,
    MeetingTokenResponse? meetingTokenResp,
    List<ScheduledMeeting>? scheduledMeetings,
    JoinInfo? joinInfo,
    bool? isMicEnabled,
    bool? isCameraEnabled,
    List<MeetingEvent>? eventLogs,
    String? error,
  }) {
    return MeetingState(
      status: status ?? this.status,
      launchType: launchType ?? this.launchType,
      scheduledMeetings: scheduledMeetings ?? this.scheduledMeetings,
      meeting: meeting ?? this.meeting,
      meetingTokenResp: meetingTokenResp ?? this.meetingTokenResp,
      joinInfo: joinInfo ?? this.joinInfo,
      isMicEnabled: isMicEnabled ?? this.isMicEnabled,
      isCameraEnabled: isCameraEnabled ?? this.isCameraEnabled,
      eventLogs: eventLogs ?? this.eventLogs,
      error: error,
    );
  }
}
