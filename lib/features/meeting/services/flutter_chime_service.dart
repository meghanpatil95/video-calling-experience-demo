import 'package:flutter/cupertino.dart';
import 'package:flutter_amazon_chime/flutter_amazon_chime.dart';

import '../data/models/meeting_response.dart';


class FlutterChimeService  {
  final AmazonChime _sdk = AmazonChime.instance;
  /*@override
  Future<void> initialize() async {

    if (!await AmazonChime.instance.hasAudioPermissions()) {
      await AmazonChime.instance.requestAudioPermissions();
    }

    if (!await AmazonChime.instance.hasVideoPermissions()) {
      await AmazonChime.instance.requestVideoPermissions();
    }
  }*/

  @override
  Future<void> initialize() async {
    final hasAudio = await AmazonChime.instance.hasAudioPermissions();
    debugPrint("Has Audio Permission: $hasAudio");

    if (!hasAudio) {
      try {
        await AmazonChime.instance.requestAudioPermissions();
      } catch (e) {
        debugPrint("Audio Permission Error: $e");
        rethrow;
      }
    }

    final hasVideo = await AmazonChime.instance.hasVideoPermissions();
    debugPrint("Has Video Permission: $hasVideo");

    if (!hasVideo) {
      try {
        await AmazonChime.instance.requestVideoPermissions();
      } catch (e) {
        debugPrint("Video Permission Error: $e");
        rethrow;
      }
    }
  }

  @override
  Future<void> joinMeeting(MeetingResponse response) async {
    //final joinInfo = meeting.toJoinInfo();
    final joinInfo = JoinInfo(
      meetingId: response.data.meeting.meetingId,
      attendeeId: response.data.attendee.attendeeId,
      joinToken: response.data.attendee.joinToken,
      externalMeetingId: response.data.meeting.externalMeetingId ?? "",
      audioHostUrl: response.data.meeting.mediaPlacement.audioHostUrl,
      audioFallbackUrl: response.data.meeting.mediaPlacement.audioFallbackUrl,
      signalingUrl: response.data.meeting.mediaPlacement.signalingUrl,
      turnControlUrl: response.data.meeting.mediaPlacement.turnControlUrl,
      mediaRegion: response.data.meeting.mediaRegion.toString(),
      externalUserId: response.data.meeting.externalMeetingId.toString(),
    );

    debugPrint("MeetingId : ${joinInfo.meetingId}");
    debugPrint("AudioHost : ${joinInfo.audioHostUrl}");
    debugPrint("Fallback : ${joinInfo.audioFallbackUrl}");
    debugPrint("Signal    : ${joinInfo.signalingUrl}");
    debugPrint("Turn      : ${joinInfo.turnControlUrl}");
    debugPrint("Attendee  : ${joinInfo.attendeeId}");

    try {
      await AmazonChime.instance.joinMeeting(joinInfo);
      debugPrint("Meeting joined successfully");
    } catch (e, stackTrace) {
      debugPrint("=========== JOIN ERROR ===========");
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
    }
  }

  @override
  Future<void> leaveMeeting() async {
    await AmazonChime.instance.stopMeeting();
  }

  @override
  Future<void> startLocalVideo() async {
    await AmazonChime.instance.startLocalVideo();
  }

  @override
  Future<void> stopLocalVideo() async {
    await AmazonChime.instance.stopLocalVideo();
  }

  @override
  Future<void> switchCamera() async {
    await AmazonChime.instance.switchCamera();
  }

  @override
  Future<void> toggleMic() async {}

  @override
  Future<void> toggleCamera() async {}

  @override
  void dispose() {}
}
