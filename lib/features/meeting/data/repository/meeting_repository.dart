import 'package:flutter/cupertino.dart';

import '../../../../core/errors/api_exception.dart';
import '../../../../core/network/result.dart';

import '../datasource/meeting_api_service.dart';
import '../models/meeting_response.dart';
import '../models/meeting_token_response.dart';

class MeetingRepository {
  final MeetingApiService apiService;

  MeetingRepository(this.apiService);

  Future<Result<MeetingResponse>> createMeeting({
    required String type,
    String? meetingId,
  }) async {
    try {
      /*final json = await apiService.createMeeting(
        type: type,
        meetingId: meetingId,
      );*/
      debugPrint("type repo:: $type \n meetingId : $meetingId");
      if (type == 'agent' && meetingId == null) {
        var json1 = {
          "status": "success",
          "message": "Meeting created successfully",
          "data": {
            "meeting": {
              "MeetingId": "2403a754-44a8-4add-bde8-6614d9312954",
              "ExternalMeetingId": "2341",
              "MediaRegion": "ap-southeast-1",
              "MediaPlacement": {
                "AudioHostUrl":
                    "123954fe73499a8c1d799ba659b436f2.k.m1.as1.app.chime.aws:3478",
                "AudioFallbackUrl":
                    "wss://wss.k.m1.as1.app.chime.aws:443/calls/2403a754-44a8-4add-bde8-6614d9312954",
                "SignalingUrl":
                    "wss://signal.m1.as1.app.chime.aws/control/2403a754-44a8-4add-bde8-6614d9312954",
                "TurnControlUrl":
                    "https://2954.cell.ap-southeast-1.meetings.chime.aws/v2/turn_sessions",
                "ScreenDataUrl":
                    "wss://bitpw.m1.as1.app.chime.aws:443/v2/screen/2403a754-44a8-4add-bde8-6614d9312954",
                "ScreenViewingUrl":
                    "wss://bitpw.m1.as1.app.chime.aws:443/ws/connect?passcode=null&viewer_uuid=null&X-BitHub-Call-Id=2403a754-44a8-4add-bde8-6614d9312954",
                "ScreenSharingUrl":
                    "wss://bitpw.m1.as1.app.chime.aws:443/v2/screen/2403a754-44a8-4add-bde8-6614d9312954",
                "EventIngestionUrl":
                    "https://data.svc.as1.ingest.chime.aws/v1/client-events",
              },
              "MeetingFeatures": {
                "Audio": {"EchoReduction": "UNAVAILABLE"},
              },
              "TenantIds": [],
              "MeetingArn":
                  "arn:aws:chime:ap-southeast-1:490864477453:meeting/2403a754-44a8-4add-bde8-6614d9312954",
            },
            "attendee": {
              "ExternalUserId": "agent",
              "AttendeeId": "2b680e14-9532-980c-3dfe-5d29ccf08b79",
              "JoinToken":
                  "MmI2ODBlMTQtOTUzMi05ODBjLTNkZmUtNWQyOWNjZjA4Yjc5OjA3OWJlNjk4LTgyZmMtNDg3MS1hZjBlLWY0ODJhNTNlYmVkYQ",
              "Capabilities": {
                "Audio": "SendReceive",
                "Video": "SendReceive",
                "Content": "SendReceive",
              },
            },
          },
        };
        return Success(MeetingResponse.fromJson(json1));
      } else if (type == 'agent' && meetingId != null) {
        var json2 = {
          "status": "success",
          "message": "agent token retrieved successfully ",
          "data": {
            "meeting": {"MeetingId": "2403a754-44a8-4add-bde8-6614d9312954"},
            "attendee": {
              "ExternalUserId": "agent",
              "AttendeeId": "2b680e14-9532-980c-3dfe-5d29ccf08b79",
              "JoinToken":
                  "MmI2ODBlMTQtOTUzMi05ODBjLTNkZmUtNWQyOWNjZjA4Yjc5OjA3OWJlNjk4LTgyZmMtNDg3MS1hZjBlLWY0ODJhNTNlYmVkYQ",
              "Capabilities": {
                "Audio": "SendReceive",
                "Video": "SendReceive",
                "Content": "SendReceive",
              },
            },
          },
        };
        return Success(MeetingResponse.fromJson(json2));
      } else if (type == 'client' && meetingId != null) {
        var json3 = {
          "status": "success",
          "message": "client token retrieved successfully ",
          "data": {
            "meeting": {"MeetingId": "2403a754-44a8-4add-bde8-6614d9312954"},
            "attendee": {
              "ExternalUserId": "client",
              "AttendeeId": "606d7bdc-c5f1-6167-1f2f-c15452a6e2c7",
              "JoinToken":
                  "NjA2ZDdiZGMtYzVmMS02MTY3LTFmMmYtYzE1NDUyYTZlMmM3OmEwZDVkM2E2LTk5OGYtNGVkMC1hMjhmLTFhN2YxZDkzZDdjOA",
              "Capabilities": {
                "Audio": "SendReceive",
                "Video": "SendReceive",
                "Content": "SendReceive",
              },
            },
          },
        };
        return Success(MeetingResponse.fromJson(json3));
      }

      return Success(MeetingResponse.fromJson({}));
    } on ApiException catch (e) {
      return Failure(e.message);
    } catch (e, stackTrace) {
      debugPrint("Exception: $e");
      debugPrintStack(stackTrace: stackTrace);

      return Failure(e.toString());
    }
  }

  Future<Result<MeetingTokenResponse>> joinMeeting({
    required String type,
    String? meetingId,
  }) async {
    try {
      /*final json = await apiService.createMeeting(
        type: type,
        meetingId: meetingId,
      );*/
      debugPrint("type repo:: $type \n meetingId : $meetingId");
      if (type == 'agent' && meetingId == null) {
        var json1 = {
          "status": "success",
          "message": "Meeting created successfully",
          "data": {
            "meeting": {
              "MeetingId": "2403a754-44a8-4add-bde8-6614d9312954",
              "ExternalMeetingId": "2341",
              "MediaRegion": "ap-southeast-1",
              "MediaPlacement": {
                "AudioHostUrl":
                    "123954fe73499a8c1d799ba659b436f2.k.m1.as1.app.chime.aws:3478",
                "AudioFallbackUrl":
                    "wss://wss.k.m1.as1.app.chime.aws:443/calls/2403a754-44a8-4add-bde8-6614d9312954",
                "SignalingUrl":
                    "wss://signal.m1.as1.app.chime.aws/control/2403a754-44a8-4add-bde8-6614d9312954",
                "TurnControlUrl":
                    "https://2954.cell.ap-southeast-1.meetings.chime.aws/v2/turn_sessions",
                "ScreenDataUrl":
                    "wss://bitpw.m1.as1.app.chime.aws:443/v2/screen/2403a754-44a8-4add-bde8-6614d9312954",
                "ScreenViewingUrl":
                    "wss://bitpw.m1.as1.app.chime.aws:443/ws/connect?passcode=null&viewer_uuid=null&X-BitHub-Call-Id=2403a754-44a8-4add-bde8-6614d9312954",
                "ScreenSharingUrl":
                    "wss://bitpw.m1.as1.app.chime.aws:443/v2/screen/2403a754-44a8-4add-bde8-6614d9312954",
                "EventIngestionUrl":
                    "https://data.svc.as1.ingest.chime.aws/v1/client-events",
              },
              "MeetingFeatures": {
                "Audio": {"EchoReduction": "UNAVAILABLE"},
              },
              "TenantIds": [],
              "MeetingArn":
                  "arn:aws:chime:ap-southeast-1:490864477453:meeting/2403a754-44a8-4add-bde8-6614d9312954",
            },
            "attendee": {
              "ExternalUserId": "agent",
              "AttendeeId": "2b680e14-9532-980c-3dfe-5d29ccf08b79",
              "JoinToken":
                  "MmI2ODBlMTQtOTUzMi05ODBjLTNkZmUtNWQyOWNjZjA4Yjc5OjA3OWJlNjk4LTgyZmMtNDg3MS1hZjBlLWY0ODJhNTNlYmVkYQ",
              "Capabilities": {
                "Audio": "SendReceive",
                "Video": "SendReceive",
                "Content": "SendReceive",
              },
            },
          },
        };
        return Success(MeetingTokenResponse.fromJson(json1));
      } else if (type == 'agent' && meetingId != null) {
        var json2 = {
          "status": "success",
          "message": "agent token retrieved successfully ",
          "data": {
            "meeting": {"MeetingId": "2403a754-44a8-4add-bde8-6614d9312954"},
            "attendee": {
              "ExternalUserId": "agent",
              "AttendeeId": "2b680e14-9532-980c-3dfe-5d29ccf08b79",
              "JoinToken":
                  "MmI2ODBlMTQtOTUzMi05ODBjLTNkZmUtNWQyOWNjZjA4Yjc5OjA3OWJlNjk4LTgyZmMtNDg3MS1hZjBlLWY0ODJhNTNlYmVkYQ",
              "Capabilities": {
                "Audio": "SendReceive",
                "Video": "SendReceive",
                "Content": "SendReceive",
              },
            },
          },
        };
        return Success(MeetingTokenResponse.fromJson(json2));
      } else if (type == 'client' && meetingId != null) {
        var json3 = {
          "status": "success",
          "message": "client token retrieved successfully ",
          "data": {
            "meeting": {"MeetingId": "2403a754-44a8-4add-bde8-6614d9312954"},
            "attendee": {
              "ExternalUserId": "client",
              "AttendeeId": "606d7bdc-c5f1-6167-1f2f-c15452a6e2c7",
              "JoinToken":
                  "NjA2ZDdiZGMtYzVmMS02MTY3LTFmMmYtYzE1NDUyYTZlMmM3OmEwZDVkM2E2LTk5OGYtNGVkMC1hMjhmLTFhN2YxZDkzZDdjOA",
              "Capabilities": {
                "Audio": "SendReceive",
                "Video": "SendReceive",
                "Content": "SendReceive",
              },
            },
          },
        };
        return Success(MeetingTokenResponse.fromJson(json3));
      }

      return Success(MeetingTokenResponse.fromJson({}));
    } on ApiException catch (e) {
      return Failure(e.message);
    } catch (e, stackTrace) {
      debugPrint("Exception: $e");
      debugPrintStack(stackTrace: stackTrace);

      return Failure(e.toString());
    }
  }
}
