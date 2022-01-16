import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/user.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/account/profile.dart';
import 'package:let_tutor/ui/account/widgets/list_item.dart';
import 'package:let_tutor/utils/handle_error_fetch.dart';
import 'package:let_tutor/widgets/app_bar.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef LogoutCallback = Function();
typedef UserChangeCallback = Function(User user);

class Setting extends StatefulWidget {
  const Setting(
      {Key? key,
      required this.logoutCallback,
      required this.user,
      required this.userChangeCallback})
      : super(key: key);

  final LogoutCallback logoutCallback;
  final UserChangeCallback userChangeCallback;
  final User user;

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    Widget information = ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.user.avatar!),
        radius: 30,
      ),
      title: Text(
        widget.user.name!,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      subtitle: Text(widget.user.email!),
      contentPadding: const EdgeInsets.only(left: 60, bottom: 10),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Profile(user: widget.user, callback: widget.userChangeCallback)));
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
      widget.logoutCallback();
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
