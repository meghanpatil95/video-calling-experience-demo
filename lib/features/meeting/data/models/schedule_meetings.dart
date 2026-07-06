class ScheduledMeeting {
  final String meetingId;
  final String externalMeetingId;
  final DateTime createdAt;

  const ScheduledMeeting({
    required this.meetingId,
    required this.externalMeetingId,
    required this.createdAt,
  });
}