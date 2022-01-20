import 'dart:developer';

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
  List<Schedule> listSchedule = [];
  bool isLoadingSchedule = true;
  ScrollController scrollController = ScrollController();
  int page = 0;
  final int perPage = 10;

  @override
  void initState() {
    getListSchedule();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getListSchedule();
      }
    });
    super.initState();
  }

  getListSchedule() async {
    setState(() {
      isLoadingSchedule = true;
    });
    page++;
    List<Schedule> loadListSchedule =
        await GetAPI.getListSchedule(page, perPage);
    log('load schedule');
    setState(() {
      listSchedule.addAll(loadListSchedule);
      isLoadingSchedule = false;
    });
  }

  cancelScheduleCallback(String id) {
    setState(() {
      listSchedule.remove(listSchedule
          .firstWhere((schedule) => schedule.scheduleDetailId == id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Schedule', false, context),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            controller: scrollController,
            children: List.generate(
                listSchedule.length + 1,
                (index) => index == listSchedule.length
                    ? isLoadingSchedule
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : listSchedule.isNotEmpty
                            ? Container()
                            : const Center(
                                child: Text('There is no schedule!'),
                              )
                    : UpcomingItem(
                        schedule: listSchedule[index],
                        callback: cancelScheduleCallback,
                      )),
          )),
    );
  }
}
