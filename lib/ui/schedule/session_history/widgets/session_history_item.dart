import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:let_tutor/models/schedule.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/detail_tutor/models/detail_tutor_argument.dart';
import 'package:let_tutor/ui/schedule/session_history/widgets/part.dart';
import 'package:let_tutor/ui/schedule/session_history/widgets/record.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:intl/intl.dart';

class SessionHistoryItem extends StatelessWidget {
  const SessionHistoryItem({Key? key, required this.schedule})
      : super(key: key);

  final Schedule schedule;
  callback() {}

  @override
  Widget build(BuildContext context) {
    DateTime start = DateTime.fromMillisecondsSinceEpoch(
        schedule.scheduleDetailInfo!.startPeriodTimestamp!);
    DateFormat dateFormatStart = DateFormat('hh:mm, dd/MM/yyyy');

    int timeLearn = schedule.scheduleDetailInfo!.endPeriodTimestamp! -
        schedule.scheduleDetailInfo!.startPeriodTimestamp!;
    log(timeLearn.toString());
    int hourLearn = timeLearn ~/ (1000 * 60 * 60);
    int minuteLearn = timeLearn ~/ (1000 * 60);
    DetailTutorArgument argument = DetailTutorArgument(
        schedule.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.id!, callback);
    if (schedule.recordUrl != null) {
      log(schedule.recordUrl!);
    }
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 0,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(schedule
                      .scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar!),
                  radius: 30,
                ),
                space(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      schedule
                          .scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    space(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Part(
                          icon: Icons.calendar_today,
                          name: dateFormatStart.format(start),
                        ),
                        space(5),
                        Part(
                          icon: Icons.alarm,
                          name: '$hourLearn h $minuteLearn',
                        ),
                        space(5),
                        Part(
                          icon: Icons.star_outline,
                          name: schedule.scoreByTutor != null
                              ? 'Mark: ' +
                                  schedule.scoreByTutor!.toString() +
                                  '\n' +
                                  'Feedback: ' +
                                  schedule.tutorReview!
                              : 'Not feedback yet',
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: schedule.recordUrl != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Record(
                                videoUrl: schedule.recordUrl!,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: const Text('Record'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[50],
                    onPrimary: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.detailTutor,
                        arguments: argument);
                  },
                  child: const Text('See Tutor Details'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
