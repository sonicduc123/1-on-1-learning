import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:let_tutor/models/schedule_tutor.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/show_time_picker.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/space.dart';

void showDateSchedulePicker(
    BuildContext context, List<ScheduleTutorData> listSchedule) {
  DateTime now = DateTime.now();

  List<ScheduleTutorData> getListByDate(int i) {
    DateTime date = DateTime.now().add(Duration(days: i));
    DateTime startDate = DateTime(date.year, date.month, date.day, 0, 0, 0);
    log(startDate.toString());
    DateTime endDate = DateTime(date.year, date.month, date.day, 23, 59, 59);
    List<ScheduleTutorData> list = [];
    for (ScheduleTutorData s in listSchedule) {
      if (s.startTimestamp! >= startDate.millisecondsSinceEpoch &&
          s.startTimestamp! <= endDate.millisecondsSinceEpoch) {
        list.add(s);
      }
    }

    return list;
  }

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const Text(
              'Pick your date',
              style: TextStyle(fontSize: 20),
            ),
            space(20),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        createButtonExpanded(
                          now
                              .add(Duration(days: index))
                              .toString()
                              .substring(0, 10),
                          action: () {
                            showTimeSchedulePicker(
                                context, getListByDate(index));
                          },
                        ),
                        space(10),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
