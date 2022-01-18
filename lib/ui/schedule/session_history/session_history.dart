import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/data/network/get_api.dart';
import 'package:let_tutor/models/schedule.dart';
import 'package:let_tutor/ui/schedule/session_history/widgets/session_history_item.dart';
import 'package:let_tutor/widgets/app_bar.dart';
import 'package:let_tutor/widgets/space.dart';

class SessionHistory extends StatefulWidget {
  const SessionHistory({Key? key}) : super(key: key);

  @override
  _SessionHistoryState createState() => _SessionHistoryState();
}

class _SessionHistoryState extends State<SessionHistory> {
  List<Schedule> listHistory = [];
  bool isLoading = true;

  @override
  initState() {
    getListHistory();

    super.initState();
  }

  getListHistory() async {
    List<Schedule> loadListHistory = await GetAPI.getListHistory(1, 20);
    setState(() {
      listHistory = loadListHistory;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Session History', true, context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  // const CupertinoSearchTextField(
                  //   placeholder: 'Search message',
                  //   padding: EdgeInsets.all(8),
                  // ),
                  // space(20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          listHistory.length,
                          (index) => SessionHistoryItem(
                            schedule: listHistory[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
