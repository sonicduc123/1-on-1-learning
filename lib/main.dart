import 'package:flutter/material.dart';
import 'package:let_tutor/constants/bottom_bar.dart';
import 'package:let_tutor/models/tutor_dto.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/account/setting.dart';
import 'package:let_tutor/ui/authentication/login.dart';
import 'package:let_tutor/ui/chat/chat.dart';
import 'package:let_tutor/ui/homepage/homepage.dart';
import 'package:let_tutor/ui/schedule/upcoming/upcoming.dart';
import 'package:let_tutor/ui/tutor/tutor.dart';
import 'package:provider/provider.dart';

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
  TutorApp({Key? key}) : super(key: key);

  @override
  _TutorAppState createState() => _TutorAppState();
}

class _TutorAppState extends State<TutorApp> {
  int selectedIndex = 0;
  bool isLogin = false;
  List<TutorDTO> listTutor = [
    TutorDTO('1', 'Phạm Anh Đức', ['Conversational', 'STARTERS', 'MOVERS'], 4),
    TutorDTO('2', 'Ngô Hải Hà', ['IELTS', 'TOEFL'], 5),
    TutorDTO('3', 'Nguyễn Duy', ['Kids', 'Business'], 3),
    TutorDTO('4', 'Đạt Nguyễn', ['IELTS'], 2),
  ];

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

  void logoutCallback() {
    setState(() {
      isLogin = false;
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
            return Setting(logoutCallback: logoutCallback);
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

    return MultiProvider(
      providers: [Provider(create: (context) => listTutor)],
      child: Scaffold(
        body: setCurrentPage(),
        bottomNavigationBar: createBottonNavigationBar(),
      ),
    );
  }
}
