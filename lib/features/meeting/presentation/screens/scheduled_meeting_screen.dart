import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/meeting_state.dart';
import '../../providers/providers.dart';

class ScheduledMeetingsScreen extends ConsumerWidget {
  const ScheduledMeetingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(meetingNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Scheduled Meetings")),
      body: state.scheduledMeetings.isEmpty
          ? const Center(child: Text("No scheduled meetings"))
          : ListView.builder(
              itemCount: state.scheduledMeetings.length,
              itemBuilder: (context, index) {
                final meeting = state.scheduledMeetings[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.video_call)),
                    title: Text(meeting.externalMeetingId),
                    subtitle: Text(meeting.meetingId),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      ref
                          .read(meetingNotifierProvider.notifier)
                          .joinMeeting(meeting.meetingId);
                    },
                  ),
                );
              },
            ),
    );
  }
}
