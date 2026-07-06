import 'package:flutter_amazon_chime/models/join_info.dart';
import 'package:go_router/go_router.dart';

import '../../features/meeting/presentation/screens/home_screen.dart';
import '../../features/meeting/presentation/screens/meeting_screen.dart';
import '../../features/meeting/presentation/screens/scheduled_meeting_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const home = "/";
  static const meeting = "/meeting";
  static const scheduledMeetings = "/scheduled";
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.meeting,
      builder: (context, state) {
        final joinInfo = state.extra as JoinInfo;

        return MeetingScreen(joinInfo: joinInfo,);
      },
    ),
    GoRoute(
      path: AppRoutes.scheduledMeetings,
      builder: (context, state) =>
      const ScheduledMeetingsScreen(),
    ),
    /*GoRoute(
      path: AppRoutes.meeting,
      builder: (context, state) {
        return const MeetingScreen();
      },
    ),*/
  ],
);