import '../../../../core/errors/api_exception.dart';
import '../../../../core/network/result.dart';

import '../datasource/meeting_api_service.dart';
import '../models/meeting_response.dart';

class MeetingRepository {
  final MeetingApiService apiService;

  MeetingRepository(this.apiService);

  Future<Result<MeetingResponse>> createMeeting({
    required String type,
    String? meetingId,
  }) async {
    try {
      final json = await apiService.createMeeting(
        type: type,
        meetingId: meetingId,
      );

      return Success(
        MeetingResponse.fromJson(json),
      );
    } on ApiException catch (e) {
      return Failure(e.message);
    } catch (_) {
      return const Failure(
        "Unexpected error occurred",
      );
    }
  }
}