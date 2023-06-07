import 'package:flutter/material.dart';
import 'package:zoom_clone/resoures/authmethod.dart';
import 'package:zoom_clone/screens/history_meetings.dart';
import 'package:zoom_clone/screens/meetings.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/Home_meeting.dart';
import 'package:zoom_clone/widgets/customButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> Pages = [
    meetings(),
    History_MeetingScreen(),
    const Text('Contacts'),
    customButton(text: 'LogOut', onPressed: () => AuthMethods().signOut()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Meet and Chat'),
        backgroundColor: backgroundColor,
      ),
      body: Pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.comment_bank,
              ),
              label: 'Meet or Chat'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lock_clock,
              ),
              label: 'Meetings'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
              ),
              label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: 'Settings'),
        ],
      ),
    );
  }
}
