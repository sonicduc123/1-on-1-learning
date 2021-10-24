import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/Tutor/card_info.dart';
import 'package:let_tutor/Ultility/app_bar.dart';
import 'package:let_tutor/Ultility/space.dart';

class Tutor extends StatelessWidget {
  const Tutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutors',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Become a tutor',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const CupertinoSearchTextField(
              placeholder: 'Search tutors by name, nation, ...',
              padding: EdgeInsets.all(8),
            ),
            space(20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(10, (index) => const BriefInfoCard()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
