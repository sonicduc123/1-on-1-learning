import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:let_tutor/constants/bottom_bar.dart';
import 'package:let_tutor/data/network/get_api.dart';
import 'package:let_tutor/models/schedule.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:intl/intl.dart';

typedef TabBarCallback = void Function(int tabIndex);

class UpcomingLesson extends StatefulWidget {
  const UpcomingLesson(
      {Key? key, required this.listSchedule, required this.tabBarCallback})
      : super(key: key);

  final List<Schedule> listSchedule;
  final TabBarCallback tabBarCallback;

  @override
  _UpcomingLessonState createState() => _UpcomingLessonState();
}

class _UpcomingLessonState extends State<UpcomingLesson> {
  DateTime? upcomingDateStart;
  DateTime? upcomingDateEnd;
  DateFormat dateFormatStart = DateFormat('EEE, d MMM yyyy, hh:mm');
  DateFormat dateFormatEnd = DateFormat('hh:mm');
  int totalTimeLearn = 0;
  int hours = 0;
  int minutes = 0;

  @override
  initState() {
    setState(() {
      getTotalTimeLearn();
    });
    super.initState();
  }

  getTotalTimeLearn() async {
    totalTimeLearn = await GetAPI.getTotalTimeLearn();
    log(totalTimeLearn.toString());
    hours = totalTimeLearn ~/ 60;
    minutes = totalTimeLearn % 60;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.listSchedule.isNotEmpty) {
      upcomingDateStart = DateTime.fromMillisecondsSinceEpoch(
          widget.listSchedule[0].scheduleDetailInfo!.startPeriodTimestamp!);
      upcomingDateEnd = DateTime.fromMillisecondsSinceEpoch(
          widget.listSchedule[0].scheduleDetailInfo!.endPeriodTimestamp!);
    }
    return Container(
      child: Column(
        children: [
          Text(
            'Total lesson time is $hours hours $minutes minustes',
            style: const TextStyle(
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
            widget.listSchedule.isNotEmpty
                ? dateFormatStart.format(upcomingDateStart!) +
                    ' - ' +
                    dateFormatEnd.format(upcomingDateEnd!)
                : 'There is no schedule',
            style: const TextStyle(color: Colors.white),
          ),
          space(10),
          ElevatedButton(
            onPressed: () {
              if (widget.listSchedule.isNotEmpty) {
                Navigator.pushNamed(context, Routes.meeting);
              } else {
                widget.tabBarCallback(BottomBars.tutor);
              }
            },
            child: Text(
              widget.listSchedule.isNotEmpty
                  ? 'Enter lesson room'
                  : 'Book a schedule',
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
