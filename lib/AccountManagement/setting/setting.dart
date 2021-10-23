import 'package:flutter/material.dart';
import 'package:let_tutor/Ultility/app_bar.dart';
import 'package:let_tutor/Ultility/button_expanded.dart';
import 'package:let_tutor/Ultility/space.dart';

import 'list_item.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget information = const ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('images/avatar.png'),
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
    );

    Widget viewFeedbacks = listItem(
      Icons.person_outline,
      'View Feedbacks',
    );

    Widget bookingHistory = listItem(
      Icons.list,
      'Booking History',
    );

    Widget sessionHistory = listItem(
      Icons.history,
      'Session History',
    );

    Widget advancedSettings = listItem(
      Icons.settings_outlined,
      'Advanced Settings',
    );

    Widget outWebsite = listItem(
      Icons.language,
      'Our Website',
    );

    Widget facebook = listItem(
      Icons.facebook_outlined,
      'Facebook',
    );

    Widget version = const Align(
      alignment: Alignment.topRight,
      child: Text('Version 1.1.0'),
    );

    Widget logoutButton = createButtonExpanded('Log Out');

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
