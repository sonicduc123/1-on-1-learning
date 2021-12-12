import 'package:flutter/material.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/account/widgets/list_item.dart';
import 'package:let_tutor/widgets/app_bar.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/space.dart';

typedef LogoutCallback = Function();

class Setting extends StatelessWidget {
  const Setting({Key? key, required this.logoutCallback}) : super(key: key);

  final LogoutCallback logoutCallback;

  @override
  Widget build(BuildContext context) {
    Widget information = ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/avatar.png'),
        radius: 30,
      ),
      title: Text(
        'Phạm Anh Đức',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      subtitle: Text('phamanhduc@gmail.com'),
      contentPadding: EdgeInsets.only(left: 60, bottom: 10),
      onTap: () {
        Navigator.pushNamed(context, Routes.profile);
      },
    );

    Widget viewFeedbacks = listItem(Icons.person_outline, 'View Feedbacks');

    Widget bookingHistory = listItem(
      Icons.list,
      'Booking History',
      action: () {
        Navigator.pushNamed(context, Routes.bookingHistory);
      },
    );

    Widget sessionHistory = listItem(
      Icons.history,
      'Session History',
      action: () {
        Navigator.pushNamed(context, Routes.sessionHistory);
      },
    );

    Widget advancedSettings =
        listItem(Icons.settings_outlined, 'Advanced Settings');

    Widget outWebsite = listItem(Icons.language, 'Our Website');

    Widget facebook = listItem(Icons.facebook_outlined, 'Facebook');

    Widget version = const Align(
        alignment: Alignment.topRight, child: Text('Version 1.1.0'));

    Widget logoutButton = createButtonExpanded('Log Out', action: () {
      logoutCallback();
    });

    return Scaffold(
      appBar: createAppBar('Setttings', false, context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            information,
            viewFeedbacks,
            bookingHistory,
            sessionHistory,
            advancedSettings,
            space(15),
            outWebsite,
            facebook,
            space(5),
            version,
            logoutButton,
          ],
        ),
      ),
    );
  }
}
