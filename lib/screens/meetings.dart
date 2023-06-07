import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resoures/jitsi_meet_method.dart';

import '../widgets/Home_meeting.dart';

class meetings extends StatelessWidget {
  meetings({super.key});
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(1000000) + 1000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudiaMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeMeetingButton(
            onPressed: createNewMeeting,
            icon: Icons.videocam,
            text: 'New Meeting',
          ),
          HomeMeetingButton(
            onPressed: () => joinMeeting(context),
            icon: Icons.add_box,
            text: 'Join Meeting',
          ),
          HomeMeetingButton(
            onPressed: () {},
            icon: Icons.calendar_today,
            text: 'Schedule',
          ),
          HomeMeetingButton(
            onPressed: () {},
            icon: Icons.arrow_upward_rounded,
            text: 'Share Screen',
          )
        ],
      ),
      const Expanded(
        child: Center(
          child: Text(
            'Create or Join Meetings with Just a click!!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    ]);
  }
}
