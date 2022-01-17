import 'package:flutter/material.dart';
import 'package:let_tutor/data/network/get_api.dart';
import 'package:let_tutor/models/schedule.dart';
import 'package:let_tutor/ui/schedule/upcoming/upcoming_item.dart';
import 'package:let_tutor/widgets/app_bar.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  List<Schedule>? listSchedule;
  bool isLoading = true;

  @override
  void initState() {
    getListSchedule();
    super.initState();
  }

  getListSchedule() async {
    listSchedule = await GetAPI.getListSchedule(1, 20);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Schedule', false, context),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: List.generate(
                    listSchedule!.length, (index) => UpcomingItem(schedule: listSchedule![index],)),
              ),
            ),
    );
  }
}
