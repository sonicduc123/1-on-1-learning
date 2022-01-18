import 'package:flutter/material.dart';
import 'package:let_tutor/models/schedule.dart';
import 'package:let_tutor/ui/schedule/upcoming/upcoming_item.dart';
import 'package:let_tutor/widgets/app_bar.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({Key? key, required this.listSchedule}) : super(key: key);

  final List<Schedule> listSchedule;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Schedule', false, context),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: listSchedule.isNotEmpty
            ? ListView(
                children: List.generate(
                    listSchedule.length,
                    (index) => UpcomingItem(
                          schedule: listSchedule[index],
                        )),
              )
            : const Center(
                child: Text('There is no schedule!'),
              ),
      ),
    );
  }
}
