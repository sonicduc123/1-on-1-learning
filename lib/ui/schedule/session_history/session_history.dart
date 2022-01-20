import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/data/network/get_api.dart';
import 'package:let_tutor/models/schedule.dart';
import 'package:let_tutor/ui/schedule/session_history/widgets/session_history_item.dart';
import 'package:let_tutor/widgets/app_bar.dart';

class SessionHistory extends StatefulWidget {
  const SessionHistory({Key? key}) : super(key: key);

  @override
  _SessionHistoryState createState() => _SessionHistoryState();
}

class _SessionHistoryState extends State<SessionHistory> {
  List<Schedule> listHistory = [];
  bool isLoading = true;
  ScrollController scrollController = ScrollController();
  int page = 0;
  final int perPage = 10;

  @override
  initState() {
    getListHistory();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getListHistory();
      }
    });
    super.initState();
  }

  getListHistory() async {
    setState(() {
      isLoading = true;
    });
    page++;
    List<Schedule> loadListHistory = await GetAPI.getListHistory(page, perPage);
    setState(() {
      listHistory.addAll(loadListHistory);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Session History', true, context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            // const CupertinoSearchTextField(
            //   placeholder: 'Search message',
            //   padding: EdgeInsets.all(8),
            // ),
            // space(20),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: List.generate(
                    listHistory.length + 1,
                    (index) => index == listHistory.length
                        ? isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : listHistory.isNotEmpty
                                ? Container()
                                : const Center(
                                    child: Text('There is no history schedule'),
                                  )
                        : SessionHistoryItem(
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
