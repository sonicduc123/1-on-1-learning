
class ScheduleTutorMessage {
  String? message;
  List<ScheduleTutorData>? data;

  ScheduleTutorMessage({this.message, this.data});

  ScheduleTutorMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <ScheduleTutorData>[];
      json['data'].forEach((v) {
        data!.add(ScheduleTutorData.fromJson(v));
      });
    }

    // handle data in next 7 days
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day, 0, 0, 0);
    DateTime sevenDayLater = today.add(const Duration(days: 7));
    for (int i = 0; i < data!.length; i++) {
      if (data![i].startTimestamp! < today.millisecondsSinceEpoch ||
          data![i].startTimestamp! > sevenDayLater.millisecondsSinceEpoch) {
        data!.removeAt(i);
      }
    }
    data!.sort((a, b) => a.startTimestamp!.compareTo(b.startTimestamp!));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScheduleTutorData {
  String? id;
  String? tutorId;
  int? startTimestamp;
  int? endTimestamp;
  bool? isBooked;
  List<ScheduleDetails>? scheduleDetails;

  ScheduleTutorData(
      {this.id,
      this.tutorId,
      this.startTimestamp,
      this.endTimestamp,
      this.isBooked,
      this.scheduleDetails});

  ScheduleTutorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tutorId = json['tutorId'];
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    isBooked = json['isBooked'];
    if (json['scheduleDetails'] != null) {
      scheduleDetails = <ScheduleDetails>[];
      json['scheduleDetails'].forEach((v) {
        scheduleDetails!.add(ScheduleDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tutorId'] = tutorId;
    data['startTimestamp'] = startTimestamp;
    data['endTimestamp'] = endTimestamp;
    data['isBooked'] = isBooked;
    if (scheduleDetails != null) {
      data['scheduleDetails'] =
          scheduleDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScheduleDetails {
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  List<BookingInfo>? bookingInfo;
  bool? isBooked;

  ScheduleDetails(
      {this.startPeriodTimestamp,
      this.endPeriodTimestamp,
      this.id,
      this.scheduleId,
      this.bookingInfo,
      this.isBooked});

  ScheduleDetails.fromJson(Map<String, dynamic> json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    if (json['bookingInfo'] != null) {
      bookingInfo = <BookingInfo>[];
      json['bookingInfo'].forEach((v) {
        bookingInfo!.add(BookingInfo.fromJson(v));
      });
    }
    isBooked = json['isBooked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startPeriodTimestamp'] = startPeriodTimestamp;
    data['endPeriodTimestamp'] = endPeriodTimestamp;
    data['id'] = id;
    data['scheduleId'] = scheduleId;
    if (bookingInfo != null) {
      data['bookingInfo'] = bookingInfo!.map((v) => v.toJson()).toList();
    }
    data['isBooked'] = isBooked;
    return data;
  }
}

class BookingInfo {
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? studentRequest;
  String? tutorReview;
  int? scoreByTutor;
  String? recordUrl;
  bool? isDeleted;

  BookingInfo(
      {
      this.id,
      this.userId,
      this.scheduleDetailId,
      this.tutorMeetingLink,
      this.studentMeetingLink,
      this.studentRequest,
      this.tutorReview,
      this.scoreByTutor,
      this.recordUrl,
      this.isDeleted});

  BookingInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    scheduleDetailId = json['scheduleDetailId'];
    tutorMeetingLink = json['tutorMeetingLink'];
    studentMeetingLink = json['studentMeetingLink'];
    studentRequest = json['studentRequest'];
    tutorReview = json['tutorReview'];
    scoreByTutor = json['scoreByTutor'];
    recordUrl = json['recordUrl'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['scheduleDetailId'] = scheduleDetailId;
    data['tutorMeetingLink'] = tutorMeetingLink;
    data['studentMeetingLink'] = studentMeetingLink;
    data['studentRequest'] = studentRequest;
    data['tutorReview'] = tutorReview;
    data['scoreByTutor'] = scoreByTutor;
    data['recordUrl'] = recordUrl;
    data['isDeleted'] = isDeleted;
    return data;
  }
}
