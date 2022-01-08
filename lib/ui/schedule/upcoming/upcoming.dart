import 'package:flutter/material.dart';
import 'package:let_tutor/ui/Schedule/Upcoming/upcoming_item.dart';
import 'package:let_tutor/widgets/app_bar.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Schedule', false, context),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: List.generate(10, (index) => UpcomingItem()),
        ),
      ),
    );
  }
}
