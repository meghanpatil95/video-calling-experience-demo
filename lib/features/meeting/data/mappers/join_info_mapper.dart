import 'package:flutter_amazon_chime/flutter_amazon_chime.dart';
import 'package:video_calling_experience_demo/features/meeting/data/models/meeting_token_response.dart';

import '../models/meeting_response.dart';

extension MeetingResponseMapper on MeetingResponse {
  JoinInfo toJoinInfo() {
    return JoinInfo(
      meetingId: data.meeting.meetingId,
      externalMeetingId: data.meeting != null
          ? data.meeting.externalMeetingId ?? ''
          : '',
      mediaRegion: data.meeting.mediaRegion ?? "",

      audioHostUrl: data.meeting.mediaPlacement != null
          ? data.meeting.mediaPlacement.audioHostUrl
          : '',
      audioFallbackUrl: data.meeting.mediaPlacement.audioFallbackUrl,
      signalingUrl: data.meeting.mediaPlacement.signalingUrl,
      turnControlUrl: data.meeting.mediaPlacement.turnControlUrl,

      attendeeId: data.attendee.attendeeId,
      externalUserId: data.attendee.externalUserId,
      joinToken: data.attendee.joinToken,
    );
  }
}

extension MeetingTokenResponseMapper on MeetingTokenResponse {
  JoinInfo toJoinInfo() {
    return JoinInfo(
      meetingId: data.meeting.meetingId,
      externalMeetingId: '',
      mediaRegion: "",

      audioHostUrl: '',
      audioFallbackUrl: '',
      signalingUrl: '',
      turnControlUrl: '',

      attendeeId: data.attendee.attendeeId,
      externalUserId: data.attendee.externalUserId,
      joinToken: data.attendee.joinToken,
    );
  }
}
