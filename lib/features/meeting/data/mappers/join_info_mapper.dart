import 'package:flutter_amazon_chime/flutter_amazon_chime.dart';

import '../models/meeting_response.dart';

extension MeetingResponseMapper on MeetingResponse {
  JoinInfo toJoinInfo() {
    return JoinInfo(
      meetingId: data.meeting.meetingId,
      externalMeetingId: data.meeting.externalMeetingId??'',
      mediaRegion: data.meeting.mediaRegion??"",

      audioHostUrl: data.meeting.mediaPlacement.audioHostUrl,
      audioFallbackUrl: data.meeting.mediaPlacement.audioFallbackUrl,
      signalingUrl: data.meeting.mediaPlacement.signalingUrl,
      turnControlUrl: data.meeting.mediaPlacement.turnControlUrl,

      attendeeId: data.attendee.attendeeId,
      externalUserId: data.attendee.externalUserId,
      joinToken: data.attendee.joinToken,
    );
  }
}