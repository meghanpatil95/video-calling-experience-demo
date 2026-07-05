import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_amazon_chime/models/join_info.dart';
import 'package:flutter_riverpod/legacy.dart' show StateNotifier;
import 'package:video_calling_experience_demo/features/meeting/data/mappers/join_info_mapper.dart';

import '../../../../core/network/result.dart';
import '../data/models/meeting_event.dart';
import '../data/repository/meeting_repository.dart';
import 'meeting_state.dart';




class MeetingNotifier extends StateNotifier<MeetingState> {

  final MeetingRepository repository;

  MeetingNotifier(this.repository)
      : super(const MeetingState());


 /* Future<void> createMeeting() async {

    state = state.copyWith(
      status: MeetingStatus.joining,
      error: null,
    );

    final result = await repository.createMeeting(
      type: "agent",
    );

    switch (result) {

      case Success():

        state = state.copyWith(
          status: MeetingStatus.connected,
          meeting: result.data,
        );

        break;

      case Failure():

        state = state.copyWith(
          status: MeetingStatus.disconnected,
          error: result.message,
        );

        break;

    }

  }*/

  Future<void> _createOrJoinMeeting({
    required String type,
    String? meetingId,
  }) async {
    state = state.copyWith(
      status: MeetingStatus.joining,
      error: null,
    );

    final result = await repository.createMeeting(
      type: type,
      meetingId: meetingId,
    );

    switch (result) {
      case Success():
        state = state.copyWith(
          status: MeetingStatus.connected,
          meeting: result.data,
        );

        debugPrint(jsonEncode(state.meeting!.toJson()));

        // Automatically join Chime meeting
       // await joinChimeMeeting();

        break;

      case Failure():
        state = state.copyWith(
          status: MeetingStatus.disconnected,
          error: result.message,
        );
        break;
    }
  }

  Future<void> createMeeting() async {
    await _createOrJoinMeeting(type: "agent");
  }

  Future<void> joinMeeting(String meetingId) async {
    await _createOrJoinMeeting(
      type: "client",
      meetingId: meetingId,
    );
  }


  /*Future<void> joinChimeMeeting() async {
    if (state.meeting == null) return;

    try {
      final joinInfo = state.meeting!.toJoinInfo();

      await chimeService.initialize();

      await chimeService.joinMeeting(joinInfo);

      addEvent("Joined meeting");

      state = state.copyWith(
        joinInfo: joinInfo,
        status: MeetingStatus.connected,
      );
    } catch (e) {
      state = state.copyWith(
        status: MeetingStatus.disconnected,
        error: e.toString(),
      );
    }
  }*/


  /*Future<void> joinChimeMeeting() async {

    if(state.meeting == null) return;

    try{

      await chimeService.initialize();

      await chimeService.joinMeeting(state.meeting!);

      addEvent("Joined meeting");

    }catch(e){

      state=state.copyWith(
        error:e.toString(),
      );

    }

  }*/










  void addEvent(
      String message,
      ){

    final logs=[
      ...state.eventLogs,

      MeetingEvent(
        title:message,
        timestamp:DateTime.now(),
      ),
    ];

    state=state.copyWith(
      eventLogs:logs,
    );

  }





  void clearMeeting() {
    state = const MeetingState();
  }


  JoinInfo getJoinInfo() {
    final meeting = state.meeting!;

    return JoinInfo(
      meetingId: meeting.data.meeting.meetingId,
      externalMeetingId:
      meeting.data.meeting.externalMeetingId ?? "",
      mediaRegion: meeting.data.meeting.mediaRegion ?? "",

      audioHostUrl:
      meeting.data.meeting.mediaPlacement.audioHostUrl,
      audioFallbackUrl:
      meeting.data.meeting.mediaPlacement.audioFallbackUrl,
      signalingUrl:
      meeting.data.meeting.mediaPlacement.signalingUrl,
      turnControlUrl:
      meeting.data.meeting.mediaPlacement.turnControlUrl,

      attendeeId: meeting.data.attendee.attendeeId,
      externalUserId:
      meeting.data.attendee.externalUserId,
      joinToken: meeting.data.attendee.joinToken,
    );
  }

}