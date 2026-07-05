
import 'package:flutter_amazon_chime/models/join_info.dart';

import '../data/models/meeting_event.dart';
import '../data/models/meeting_response.dart';

enum MeetingStatus {
  idle,
  joining,
  connected,
  disconnected,
}


class MeetingState {
  final MeetingStatus status;

  final MeetingResponse? meeting;

  final JoinInfo? joinInfo;

  final bool isMicEnabled;

  final bool isCameraEnabled;

  final List<MeetingEvent> eventLogs;
  final String? error;

  const MeetingState({
    this.status = MeetingStatus.idle,
    this.meeting,
    this.joinInfo,
    this.isMicEnabled = true,
    this.isCameraEnabled = true,
    this.eventLogs = const [],
    this.error,
  });

  bool get isLoading => status == MeetingStatus.joining;

  MeetingState copyWith({
    MeetingStatus? status,
    MeetingResponse? meeting,
    JoinInfo? joinInfo,
    bool? isMicEnabled,
    bool? isCameraEnabled,
    List<MeetingEvent>? eventLogs,
    String? error,
  }) {
    return MeetingState(
      status: status ?? this.status,
      meeting: meeting ?? this.meeting,
      joinInfo: joinInfo ?? this.joinInfo,
      isMicEnabled: isMicEnabled ?? this.isMicEnabled,
      isCameraEnabled: isCameraEnabled ?? this.isCameraEnabled,
      eventLogs: eventLogs ?? this.eventLogs,
      error: error,
    );
  }
}