import 'package:flutter/material.dart';
import 'package:let_tutor/constants/bottom_bar.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/account/setting.dart';
import 'package:let_tutor/ui/authentication/login.dart';
import 'package:let_tutor/ui/chat/chat.dart';
import 'package:let_tutor/ui/homepage/homepage.dart';
import 'package:let_tutor/ui/schedule/upcoming/upcoming.dart';
import 'package:let_tutor/ui/tutor/tutor.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Tutor App',
      home: TutorApp(),
      routes: Routes.routes,
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
  bool isLogin = false;

  void tabBarCallback(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void loginSuccessCallback() {
    setState(() {
      isLogin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget setCurrentPage() {
      if (isLogin) {
        switch (selectedIndex) {
          case BottomBars.home:
            return HomePage(callback: tabBarCallback);
          case BottomBars.chat:
            return Chat();
          case BottomBars.upcoming:
            return Upcoming();
          case BottomBars.tutor:
            return Tutor();
          case BottomBars.setting:
            return Setting();
          default:
            return HomePage(callback: tabBarCallback);
        }
      }
      return Login(loginSuccessCallback: loginSuccessCallback);
    }

    Widget? createBottonNavigationBar() {
      if (isLogin) {
        return BottomNavigationBar(
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
        );
      }
      return null;
    }

    return Scaffold(
      body: setCurrentPage(),
      bottomNavigationBar: createBottonNavigationBar(),
    );
  }
}
