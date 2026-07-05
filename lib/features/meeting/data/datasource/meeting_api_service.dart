import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/network_service.dart';

class MeetingApiService {
  final NetworkService networkService;

  MeetingApiService(this.networkService);

  Future<Map<String,dynamic>> createMeeting({
    required String type,
    String? meetingId,
  }) async {
    return await networkService.post(
      ApiConstants.meetings,
      data: {
        "type": type,
        if (meetingId != null) "meeting_id": meetingId,
      },
    );


  }
}