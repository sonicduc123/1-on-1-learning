import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/ui/schedule/session_history/widgets/session_history_item.dart';
import 'package:let_tutor/widgets/app_bar.dart';
import 'package:let_tutor/widgets/space.dart';

class SessionHistory extends StatelessWidget {
  const SessionHistory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Session History', true, context),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const CupertinoSearchTextField(
              placeholder: 'Search message',
              padding: EdgeInsets.all(8),
            ),
            space(20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(10, (index) => const SessionHistoryItem()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}