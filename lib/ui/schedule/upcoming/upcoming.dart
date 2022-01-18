import 'package:flutter/material.dart';
import 'package:let_tutor/models/schedule.dart';
import 'package:let_tutor/ui/schedule/upcoming/upcoming_item.dart';
import 'package:let_tutor/widgets/app_bar.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key, required this.listSchedule}) : super(key: key);

  final List<Schedule> listSchedule;

  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  List<Schedule> listSchedule = [];

  @override
  void initState() {
    setState(() {
      listSchedule = widget.listSchedule;
    });
    super.initState();
  }

  cancelScheduleCallback(String id) {
    setState(() {
      listSchedule
          .remove(listSchedule.firstWhere((schedule) => schedule.scheduleDetailId == id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Schedule', false, context),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: widget.listSchedule.isNotEmpty
            ? ListView(
                children: List.generate(
                    widget.listSchedule.length,
                    (index) => UpcomingItem(
                          schedule: widget.listSchedule[index],
                          callback: cancelScheduleCallback,
                        )),
              )
            : const Center(
                child: Text('There is no schedule!'),
              ),
      ),
    );
  }
}
