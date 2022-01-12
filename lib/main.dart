import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:let_tutor/constants/bottom_bar.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/tutors.dart';
import 'package:let_tutor/models/user.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/account/setting.dart';
import 'package:let_tutor/ui/authentication/login.dart';
import 'package:let_tutor/ui/chat/chat.dart';
import 'package:let_tutor/ui/course/course_page.dart';
import 'package:let_tutor/ui/homepage/homepage.dart';
import 'package:let_tutor/ui/schedule/upcoming/upcoming.dart';
import 'package:let_tutor/ui/tutor/tutor.dart';
import 'package:let_tutor/utils/handle_error_fetch.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Tutor App',
      home: TutorApp(),
      routes: Routes.routes,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
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
  UserInfor? userInfor;
  Tutors? listTutor;
  TutorsInfo? tutorsInfo;

  @override
  void initState() {
    getUserInfor();
    getListTutor();
  }

  void getListTutor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response response = await get(Uri.parse(Endpoints.getListTutor), headers: {
      "Authorization": "Bearer " + prefs.getString("accessToken")!,
    });
    if (response.statusCode != 200) {
      handleErrorFetch(response.body, context);
    }
    tutorsInfo = TutorsInfo.fromJson(jsonDecode(response.body));
    listTutor = tutorsInfo!.tutors;
  }

  void getUserInfor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response response = await get(Uri.parse(Endpoints.getUserInfor), headers: {
      "Authorization": "Bearer " + prefs.getString("accessToken")!,
    });
    if (response.statusCode != 200) {
      handleErrorFetch(response.body, context);
    }
    userInfor = UserInfor.fromJson(jsonDecode(response.body));
  }

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
          case BottomBars.course:
            return CoursePage();
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
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Course'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time), label: 'Schedule'),
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
              if (index == BottomBars.home || index == BottomBars.tutor) {
                getListTutor();
              }
              selectedIndex = index;
            });
          },
        );
      }
      return null;
    }

    return MultiProvider(
      providers: [
        Provider(create: (context) => listTutor!.listTutor),
        Provider(create: (context) => userInfor)
      ],
      child: Scaffold(
        body: setCurrentPage(),
        bottomNavigationBar: createBottonNavigationBar(),
      ),
    );
  }
}
