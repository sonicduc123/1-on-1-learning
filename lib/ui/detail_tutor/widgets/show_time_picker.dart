import 'package:flutter/material.dart';
import 'package:let_tutor/models/schedule_tutor.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/show_booking_infor.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showTimeSchedulePicker(
    BuildContext context, List<ScheduleTutorData> listSchedule) {
  List<String> startTime = [];
  List<String> endTime = [];
  int now = DateTime.now().millisecondsSinceEpoch;
  for (int i = 0; i < listSchedule.length; i++) {
    DateTime start =
        DateTime.fromMillisecondsSinceEpoch(listSchedule[i].startTimestamp!);
    startTime.add(start.toString().substring(11, 16));

    DateTime end =
        DateTime.fromMillisecondsSinceEpoch(listSchedule[i].endTimestamp!);
    endTime.add(end.toString().substring(11, 16));
  }
  String userId = "";
  SharedPreferences.getInstance()
      .then((prefs) => userId = prefs.getString('id')!);

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const Text(
                  'Pick your time',
                  style: TextStyle(fontSize: 20),
                ),
                space(20),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: listSchedule.length,
                      itemBuilder: (BuildContext context, int index) {
                        callback() {
                          setState(() {
                            listSchedule[index].isBooked =
                                !listSchedule[index].isBooked!;
                          });
                        }

                        return Column(
                          children: [
                            createButtonExpanded(
                              listSchedule[index].isBooked!
                                  ? listSchedule[index]
                                                  .scheduleDetails![0]
                                                  .bookingInfo !=
                                              null &&
                                          listSchedule[index]
                                                  .scheduleDetails![0]
                                                  .bookingInfo![0]
                                                  .userId ==
                                              userId
                                      ? 'Booked'
                                      : 'Reserved'
                                  : startTime[index] + ' - ' + endTime[index],
                              action: listSchedule[index].isBooked! ||
                                      listSchedule[index].endTimestamp! < now
                                  ? null
                                  : () {
                                      showBookingInforDialog(
                                        listSchedule[index]
                                            .scheduleDetails![0]
                                            .id!,
                                        DateTime.fromMillisecondsSinceEpoch(
                                                listSchedule[index]
                                                    .startTimestamp!)
                                            .toString()
                                            .substring(0, 10),
                                        startTime[index],
                                        endTime[index],
                                        context,
                                        callback,
                                      );
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
    },
  );
}
