import 'package:let_tutor/models/tutor_student.dart';

class Feedbacks {
  String? id;
  int? rating;
  String? content;
  String? createdAt;
  Student? student;
  String time = "";

  Feedbacks({this.id, this.rating, this.content, this.createdAt, this.student});

  Feedbacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    content = json['content'];
    createdAt = json['createdAt'];
    time = calculateTimeToNow(DateTime.parse(createdAt!));
    student = json['firstInfo'] != null
        ? Student.fromJson(json['firstInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rating'] = rating;
    data['content'] = content;
    data['createdAt'] = createdAt;
    if (student != null) {
      data['firstInfo'] = student!.toJson();
    }
    return data;
  }

  String calculateTimeToNow(DateTime start) {
    DateTime today = DateTime.now();
    today = DateTime(today.year, today.month, today.day,
        today.hour + today.timeZoneOffset.inHours, today.minute, today.second);
    int timeInSecond = today.difference(start).inSeconds;
    if (timeInSecond >= 365 * 24 * 60 * 60) {
      return (timeInSecond ~/ (365 * 24 * 60 * 60)).toString() + " years ago";
    }
    if (timeInSecond >= 30 * 24 * 60 * 60) {
      return (timeInSecond ~/ (30 * 24 * 60 * 60)).toString() + " months ago";
    }
    if (timeInSecond >= 24 * 60 * 60) {
      return (timeInSecond ~/ (24 * 60 * 60)).toString() + " days ago";
    }
    if (timeInSecond >= 60 * 60) {
      return (timeInSecond ~/ (60 * 60)).toString() + " hours ago";
    }
    if (timeInSecond >= 60) {
      return (timeInSecond ~/ (60)).toString() + " minutes ago";
    }
    return timeInSecond.toString() + " seconds ago";
  }
}
