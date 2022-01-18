import 'package:flutter/material.dart';
import 'package:let_tutor/models/schedule.dart';
import 'package:let_tutor/widgets/space.dart';

class UpcomingItem extends StatelessWidget {
  const UpcomingItem({Key? key, required this.schedule}) : super(key: key);

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    DateTime start = DateTime.fromMillisecondsSinceEpoch(
        schedule.scheduleDetailInfo!.startPeriodTimestamp!);

    DateTime end = DateTime.fromMillisecondsSinceEpoch(
        schedule.scheduleDetailInfo!.endPeriodTimestamp!);

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
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
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
