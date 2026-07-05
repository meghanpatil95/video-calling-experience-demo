import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/network_service.dart';
import '../data/datasource/meeting_api_service.dart';
import '../data/repository/meeting_repository.dart';
import '../services/chime_service.dart';
import '../services/flutter_chime_service.dart';
import 'meeting_notifier.dart';
import 'meeting_state.dart';
final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService();
});

final meetingApiProvider = Provider<MeetingApiService>((ref) {
  return MeetingApiService(
    ref.read(networkServiceProvider),
  );
});


final meetingRepositoryProvider =
Provider<MeetingRepository>((ref) {
  return MeetingRepository(
    ref.read(meetingApiProvider),
  );
});


final meetingNotifierProvider =
StateNotifierProvider<MeetingNotifier, MeetingState>((ref) {
  return MeetingNotifier(
    ref.read(meetingRepositoryProvider),
  );
});




