import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:video_calling_experience_demo/features/meeting/data/mappers/join_info_mapper.dart';

import '../../../../core/routes/app_router.dart';
import '../../providers/meeting_state.dart';
import '../../providers/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _meetingIdController = TextEditingController();

  @override
  void dispose() {
    _meetingIdController.dispose();
    super.dispose();
  }

  void _createMeeting(MeetingLaunchType meetLaunchType) {
    FocusScope.of(context).unfocus();

    ref.read(meetingNotifierProvider.notifier).createMeeting(meetLaunchType);
  }

  void _joinMeeting() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    ref
        .read(meetingNotifierProvider.notifier)
        .joinMeeting(_meetingIdController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(meetingNotifierProvider);

    ref.listen<MeetingState>(meetingNotifierProvider, (previous, next) {
      /// Show Error
      if (next.error != null &&
          next.error!.isNotEmpty &&
          previous?.error != next.error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error!)));
      }

      debugPrint("previous?.status :: ${previous?.status}");
      debugPrint("next?.status :: ${next?.status}");
      debugPrint("error :: ${next.error}");

      /*/// Navigate on Success
      if (previous?.status != MeetingStatus.connected &&
          next.status == MeetingStatus.connected) {
        _meetingIdController.clear();

        final joinInfo = next.meeting!.toJoinInfo();

        context.push(AppRoutes.meeting, extra: joinInfo);
      }*/

      if (previous?.status != MeetingStatus.connected &&
          next.status == MeetingStatus.connected) {
        _meetingIdController.clear();

        if (next.launchType == MeetingLaunchType.instant) {
          // context.push(AppRoutes.meeting, extra: next.meeting?.toJoinInfo());

          final notifier = ref.read(meetingNotifierProvider.notifier);

          final joinInfo = next.meetingTokenResp != null
              ? notifier.getJoinInfoForToken()
              : notifier.getJoinInfo();

          context.push(AppRoutes.meeting, extra: joinInfo);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Meeting scheduled successfully")),
          );
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hipster Assessment"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 450),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Icon(Icons.video_call, size: 60),

                          const SizedBox(height: 16),

                          Text(
                            "Amazon Chime Meeting",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),

                          const SizedBox(height: 30),

                          /* SizedBox(
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: state.isLoading
                                  ? null
                                  : _createMeeting,
                              icon: const Icon(Icons.add),
                              label:
                              const Text("Create Meeting"),
                            ),
                          ),*/
                          SizedBox(
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: state.isLoading
                                  ? null
                                  : () => _showMeetingOptions(),
                              icon: const Icon(Icons.add),
                              label: const Text("New Meeting"),
                            ),
                          ),

                          if (state.meeting != null) ...[
                            const SizedBox(height: 20),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Meeting ID",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  SelectableText(
                                    state.meeting!.data.meeting.meetingId,
                                  ),
                                ],
                              ),
                            ),
                          ],

                          const SizedBox(height: 32),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.schedule),
                            label: const Text("Scheduled Meetings"),
                            onPressed: () {
                              context.push(AppRoutes.scheduledMeetings);
                            },
                          ),
                          Row(
                            children: const [
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text("OR"),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),

                          const SizedBox(height: 32),

                          TextFormField(
                            controller: _meetingIdController,
                            enabled: !state.isLoading,
                            decoration: const InputDecoration(
                              labelText: "Meeting ID",
                              hintText: "Enter Meeting ID",
                              prefixIcon: Icon(Icons.meeting_room),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please enter Meeting ID";
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          SizedBox(
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: state.isLoading ? null : _joinMeeting,
                              icon: const Icon(Icons.login),
                              label: const Text("Join Meeting"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// Loading Overlay
          if (state.isLoading)
            Positioned.fill(
              child: ColoredBox(
                color: Colors.black26,
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }

  void _showMeetingOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.videocam)),
                  title: const Text("Start Instant Meeting"),
                  subtitle: const Text("Start a meeting right now"),
                  onTap: () {
                    Navigator.pop(context);
                    //_createMeeting();
                    //_createMeeting(MeetingLaunchType.instant);
                    ref
                        .read(meetingNotifierProvider.notifier)
                        .createMeeting(MeetingLaunchType.instant);
                  },
                ),

                ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.calendar_today),
                  ),
                  title: const Text("Schedule for Later"),
                  subtitle: const Text("Generate a meeting for future use"),
                  onTap: () {
                    Navigator.pop(context);
                    ref
                        .read(meetingNotifierProvider.notifier)
                        .createMeeting(MeetingLaunchType.scheduled);
                    //_createMeeting(MeetingLaunchType.scheduled);
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text("Schedule Meeting feature coming soon"),
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
