import 'package:flutter/cupertino.dart';
import 'package:let_tutor/data/network/del_api/cancel_booking.dart';

class DelAPI {
  // cancel booking
  static cancelBooking(String scheduleDetailId, BuildContext context) =>
      cancelBookingAPI(scheduleDetailId, context);
}
