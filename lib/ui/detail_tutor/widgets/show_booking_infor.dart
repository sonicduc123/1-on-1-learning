import 'package:flutter/material.dart';
import 'package:let_tutor/data/network/post_api.dart';
import 'package:let_tutor/widgets/dialog.dart';
import 'package:let_tutor/widgets/space.dart';

typedef Callback = Function();

Future<void> showBookingInforDialog(String scheduleId, String date,
    String start, String end, BuildContext context, Callback callback) async {
  bookAClass(String scheduleId, String note, BuildContext context) async {
    String message = await PostAPI.bookAClass(scheduleId, note, context);
    Navigator.pop(context);
    if (message == "success") {
      makeDialog('Booking successfully',
          'Please wait to join meeting with your tutor.', context);
      callback();
    } else {
      makeDialog('Error', message, context);
    }
  }

  TextEditingController noteController = TextEditingController();

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Booking information: '),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("Date: $date, $start - $end"),
              space(10),
              const Text("Note: "),
              TextField(
                controller: noteController,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: 5,
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Book'),
            onPressed: () {
              bookAClass(scheduleId, noteController.text, context);
            },
          ),
        ],
      );
    },
  );
}
