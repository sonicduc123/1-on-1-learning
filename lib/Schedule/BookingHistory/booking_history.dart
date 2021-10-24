import 'package:flutter/material.dart';
import 'package:let_tutor/Schedule/BookingHistory/booking_history_item.dart';
import 'package:let_tutor/Ultility/app_bar.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Booking History', true, context),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: List.generate(10, (index) => BookingHistoryItem()),
        ),
      ),
    );
  }
}