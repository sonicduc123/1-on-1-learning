
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:let_tutor/constants/bottom_bar.dart';
import 'package:let_tutor/constants/supported_location.dart';
import 'package:let_tutor/data/network/get_api.dart';
import 'package:let_tutor/models/tutors.dart';
import 'package:let_tutor/models/user.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/account/setting.dart';
import 'package:let_tutor/ui/authentication/login.dart';
import 'package:let_tutor/ui/course/course_page.dart';
import 'package:let_tutor/ui/homepage/homepage.dart';
import 'package:let_tutor/ui/schedule/upcoming/upcoming.dart';
import 'package:let_tutor/ui/tutor/tutor.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Tutor App',
      home: const TutorApp(),
      routes: Routes.routes,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      supportedLocales: SupportedLocation.locates,
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
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
  UserInfor? userInfor;
  Tutors? listTutor;
  TutorsInfo? tutorsInfo;
  bool isLoadingUser = true;
  bool isLoadingListTutor = true;

  void getListTutor() async {
    tutorsInfo = await GetAPI.getListTutor();
    listTutor = tutorsInfo!.tutors;
    setState(() {
      isLoadingListTutor = false;
    });
  }

  void getUserInfor() async {
    userInfor = await GetAPI.getUserInfor();
    setState(() {
      isLoadingUser = false;
    });
  }

  void userChangeCallback(User userChange) {
    setState(() {
      userInfor!.user = userChange;
    });
  }

  void tabBarCallback(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void loginSuccessCallback() {
    setState(() {
      isLogin = true;
      getUserInfor();
      getListTutor();
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
        if (isLoadingListTutor || isLoadingUser) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        switch (selectedIndex) {
          case BottomBars.home:
            return HomePage(
              callback: tabBarCallback,
              user: userInfor!.user!,
              userChangeCallback: userChangeCallback,
            );
          case BottomBars.course:
            return const CoursePage();
          case BottomBars.upcoming:
            return const Upcoming();
          case BottomBars.tutor:
            return const Tutor();
          case BottomBars.setting:
            return Setting(
              logoutCallback: logoutCallback,
              user: userInfor!.user!,
              userChangeCallback: userChangeCallback,
            );
          default:
            HomePage(
              callback: tabBarCallback,
              user: userInfor!.user!,
              userChangeCallback: userChangeCallback,
            );
        }
      }
      return Login(loginSuccessCallback: loginSuccessCallback);
    }

    Widget? createBottonNavigationBar() {
      if (isLogin) {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
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
        // ChangeNotifierProvider.value(
        //   value: userInfor!.user,
        // )
      ],
      child: Scaffold(
        body: setCurrentPage(),
        bottomNavigationBar: createBottonNavigationBar(),
      ),
    );
  }
}
