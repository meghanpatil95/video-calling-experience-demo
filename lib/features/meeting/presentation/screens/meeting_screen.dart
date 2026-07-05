/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/meeting_notifier.dart';
import '../../providers/providers.dart';

class MeetingScreen extends ConsumerStatefulWidget {
  const MeetingScreen({super.key});

  @override
  ConsumerState<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends ConsumerState<MeetingScreen> {
  bool _isJoining = true;
  String? _error;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeMeeting();
    });
  }

  Future<void> _initializeMeeting() async {
    final state = ref.read(meetingNotifierProvider);

    if (state.meeting == null) {
      setState(() {
        _error = "Meeting information not found";
        _isJoining = false;
      });
      return;
    }

    try {
      final chimeService = ref.read(chimeServiceProvider);

      await chimeService.initialize();

      await chimeService.joinMeeting(state.meeting!);

      if (mounted) {
        setState(() {
          _isJoining = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isJoining = false;
        });
      }
    }
  }

  @override
  void dispose() {
    ref.read(chimeServiceProvider).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isJoining) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Meeting")),
        body: Center(
          child: Text(_error!),
        ),
      );
    }

    return const Scaffold(
      body: Center(
        child: Text("Meeting Connected"),
      ),
    );
  }
}*/



import 'package:flutter/material.dart';
import 'package:flutter_amazon_chime/flutter_amazon_chime.dart';
import 'package:provider/provider.dart';

class MeetingScreen extends StatefulWidget {
  final JoinInfo joinInfo;

  const MeetingScreen({
    super.key,
    required this.joinInfo,
  });

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  late final ChimeSession _session;

  @override
  void initState() {
    super.initState();

    _session = ChimeSession();

    _session.initializeMeeting(
      joinInfo: widget.joinInfo,
      roster: {
        widget.joinInfo.attendeeId: "Agent",
      },
    );
  }

  @override
  void dispose() {
    _session.stopMeeting();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _session,
      child: AmazonChimeView(
        title: "Hipster Video Call",
        onLeave: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}