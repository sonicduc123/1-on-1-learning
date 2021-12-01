import 'package:flutter/material.dart';
import 'package:let_tutor/ui/account/setting/setting.dart';
import 'package:let_tutor/ui/chat/chat.dart';
import 'package:let_tutor/ui/homepage/homepage.dart';
import 'package:let_tutor/ui/schedule/upcoming/upcoming.dart';
import 'package:let_tutor/ui/tutor/tutor.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My App',
      home: TutorApp(),
    ),
  );
}

class TutorApp extends StatefulWidget {
  const TutorApp({Key? key}) : super(key: key);

  @override
  _TutorAppState createState() => _TutorAppState();
}

class _TutorAppState extends State<TutorApp> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget SetCurrentPage() {
      switch (selectedIndex) {
        case 0:
          return HomePage();
        case 1:
          return Chat();
        case 2:
          return Upcoming();
        case 3:
          return Tutor();
        case 4:
          return Setting();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      body: SetCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: 'Upcomming'),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups_rounded), label: 'Tutors'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
