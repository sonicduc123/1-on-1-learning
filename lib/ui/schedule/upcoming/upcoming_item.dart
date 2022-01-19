import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:let_tutor/models/meeting_dto.dart';
import 'package:let_tutor/models/schedule.dart';
import 'package:let_tutor/ui/meeting/video_call.dart';
import 'package:let_tutor/ui/schedule/upcoming/widgets/cancel_dialog.dart';
import 'package:let_tutor/widgets/space.dart';

typedef CancelScheduleCallback = Function(String id);

class UpcomingItem extends StatelessWidget {
  const UpcomingItem({Key? key, required this.schedule, required this.callback})
      : super(key: key);

  final Schedule schedule;
  final CancelScheduleCallback callback;

  @override
  Widget build(BuildContext context) {
    gotoMeeting() {
      String link = schedule.studentMeetingLink!;
      String data = link.split('.')[1];
      int count = 0;
      while (data.length % 4 != 0) {
        count++;
        data += "0";
      }
      String decode = utf8.decode(base64Decode(data));
      MeetingDTO meetingDTO = MeetingDTO.fromJson(
          jsonDecode(decode.substring(0, decode.length - count)));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Meeting(meetingDTO: meetingDTO, token: link.substring(13)),
        ),
      );
    }

    DateTime start = DateTime.fromMillisecondsSinceEpoch(
        schedule.scheduleDetailInfo!.startPeriodTimestamp!);

    DateTime end = DateTime.fromMillisecondsSinceEpoch(
        schedule.scheduleDetailInfo!.endPeriodTimestamp!);

    DateTime now = DateTime.now();
    bool isAbleCancel = start.difference(now).inHours >= 2;

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
                    Row(
                      children: [
                        Text(start.toString().substring(0, 10) + '   '),
                        Text(
                          start.toString().substring(11, 16),
                          style: const TextStyle(color: Colors.blue),
                        ),
                        const Text(' - '),
                        Text(
                          end.toString().substring(11, 16),
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[50],
                    onPrimary: Colors.blue,
                  ),
                  onPressed: isAbleCancel
                      ? () {
                          makeCancelDialog(
                              schedule.scheduleDetailId!, callback, context);
                        }
                      : null,
                  child: const Text('Cancel'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    gotoMeeting();
                  },
                  child: const Text('Go to Meeting'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
