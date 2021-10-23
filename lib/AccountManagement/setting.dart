import 'package:flutter/material.dart';
import 'package:let_tutor/Ultility/function.dart';

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
    );

    Widget listItem(Icon icon, String name) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 15),
          child: ListTile(
            leading: icon,
            title: Text(
              name,
              style: const TextStyle(color: Colors.black),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 15,
            ),
          ),
        );

    Widget version = const Align(
      alignment: Alignment.topRight,
      child: Text('Version 1.1.0'),
    );

    Widget logoutButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.only(top: 15, bottom: 15),
      ),
      onPressed: () {},
      child: const Text(
        'Log out',
        style: TextStyle(fontSize: 16),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            information,
            listItem(
              const Icon(
                Icons.person_outline,
                color: Colors.black,
                size: 30,
              ),
              'View Feedbacks',
            ),
            listItem(
              const Icon(
                Icons.list,
                color: Colors.black,
                size: 30,
              ),
              'Booking History',
            ),
            listItem(
              const Icon(
                Icons.history,
                color: Colors.black,
                size: 30,
              ),
              'Session History',
            ),
            listItem(
              const Icon(
                Icons.settings_outlined,
                color: Colors.black,
                size: 30,
              ),
              'Advanced Settings',
            ),
            space(15),
            listItem(
              const Icon(
                Icons.language,
                color: Colors.black,
                size: 30,
              ),
              'Our Website',
            ),
            listItem(
              const Icon(
                Icons.facebook_outlined,
                color: Colors.black,
                size: 30,
              ),
              'Facebook',
            ),
            space(15),
            version,
            logoutButton,
          ],
        ),
      ),
    );
  }
}
