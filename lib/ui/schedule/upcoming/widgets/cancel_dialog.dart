import 'package:flutter/material.dart';
import 'package:let_tutor/data/network/del_api.dart';

typedef CancelScheduleCallback = Function(String id);

Future<void> makeCancelDialog(String scheduleId,
    CancelScheduleCallback callback, BuildContext context) async {
  cancelBooking() async {
    bool isCancelSuccess = await DelAPI.cancelBooking(scheduleId, context);

    if (isCancelSuccess) {
      callback(scheduleId);
    }
  }

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure to cancel this schedule?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const [
              Text("You won't able to redo this action !!!"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              cancelBooking();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
