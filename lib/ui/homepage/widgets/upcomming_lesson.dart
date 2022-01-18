import 'package:flutter/material.dart';
import 'package:let_tutor/constants/bottom_bar.dart';
import 'package:let_tutor/models/schedule.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:intl/intl.dart';

typedef TabBarCallback = void Function(int tabIndex);

class UpcommingLesson extends StatelessWidget {
  UpcommingLesson(
      {Key? key, required this.listSchedule, required this.tabBarCallback})
      : super(key: key);

  final List<Schedule> listSchedule;
  final TabBarCallback tabBarCallback;
  DateTime? upcomingDateStart;
  DateTime? upcomingDateEnd;
  DateFormat dateFormatStart = DateFormat('EEE, d MMM yyyy, hh:mm');
  DateFormat dateFormatEnd = DateFormat('hh:mm');

  @override
  Widget build(BuildContext context) {
    if (listSchedule.isNotEmpty) {
      upcomingDateStart = DateTime.fromMillisecondsSinceEpoch(
          listSchedule[0].scheduleDetailInfo!.startPeriodTimestamp!);
      upcomingDateEnd = DateTime.fromMillisecondsSinceEpoch(
          listSchedule[0].scheduleDetailInfo!.endPeriodTimestamp!);
    }
    return Container(
      child: Column(
        children: [
          const Text(
            'Total lesson time is 11 hours 46 minustes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          space(10),
          const Text(
            'Upcoming Lesson',
            style: TextStyle(color: Colors.white),
          ),
          space(10),
          Text(
            listSchedule.isNotEmpty
                ? dateFormatStart.format(upcomingDateStart!) +
                    ' - ' +
                    dateFormatEnd.format(upcomingDateEnd!)
                : 'There is no schedule',
            style: const TextStyle(color: Colors.white),
          ),
          space(10),
          ElevatedButton(
            onPressed: () {
              if (listSchedule.isNotEmpty) {
                Navigator.pushNamed(context, Routes.meeting);
              } else {
                tabBarCallback(BottomBars.tutor);
              }
            },
            child: Text(
              listSchedule.isNotEmpty ? 'Enter lesson room' : 'Book a schedule',
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
      color: Colors.blue,
      padding: const EdgeInsets.all(30),
    );
  }
}
