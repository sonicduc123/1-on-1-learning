import 'package:let_tutor/models/course.dart';
import 'package:let_tutor/models/tutor_dto.dart';

class ScheduleMessage {
  String? message;
  ScheduleData? data;

  ScheduleMessage({this.message, this.data});

  ScheduleMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? ScheduleData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ScheduleData {
  int? count;
  List<Schedule>? schedules;

  ScheduleData({this.count, this.schedules});

  ScheduleData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      schedules = <Schedule>[];
      json['rows'].forEach((v) {
        schedules!.add(Schedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (schedules != null) {
      data['rows'] = schedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedule {
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? studentRequest;
  String? tutorReview;
  int? scoreByTutor;
  String? recordUrl;
  ScheduleDetailInfo? scheduleDetailInfo;
  bool? showRecordUrl;
  List<Courses>? studentMaterials;

  Schedule(
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
      this.scheduleDetailInfo,
      this.showRecordUrl,
      this.studentMaterials});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    scheduleDetailId = json['scheduleDetailId'];
    tutorMeetingLink = json['tutorMeetingLink'];
    studentMeetingLink = json['studentMeetingLink'];
    studentRequest = json['studentRequest'];
    tutorReview = json['tutorReview'];
    scoreByTutor = json['scoreByTutor'];
    recordUrl = json['recordUrl'];
    scheduleDetailInfo = json['scheduleDetailInfo'] != null
        ? ScheduleDetailInfo.fromJson(json['scheduleDetailInfo'])
        : null;
    showRecordUrl = json['showRecordUrl'];
    if (json['studentMaterials'] != null) {
      studentMaterials = <Courses>[];
      json['studentMaterials'].forEach((v) {
        studentMaterials!.add(Courses.fromJson(v));
      });
    }
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
    if (scheduleDetailInfo != null) {
      data['scheduleDetailInfo'] = scheduleDetailInfo!.toJson();
    }
    data['showRecordUrl'] = showRecordUrl;
    if (studentMaterials != null) {
      data['studentMaterials'] =
          studentMaterials!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScheduleDetailInfo {
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  ScheduleInfo? scheduleInfo;

  ScheduleDetailInfo(
      {this.startPeriodTimestamp,
      this.endPeriodTimestamp,
      this.id,
      this.scheduleId,
      this.scheduleInfo});

  ScheduleDetailInfo.fromJson(Map<String, dynamic> json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    scheduleInfo = json['scheduleInfo'] != null
        ? ScheduleInfo.fromJson(json['scheduleInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startPeriodTimestamp'] = startPeriodTimestamp;
    data['endPeriodTimestamp'] = endPeriodTimestamp;
    data['id'] = id;
    data['scheduleId'] = scheduleId;
    if (scheduleInfo != null) {
      data['scheduleInfo'] = scheduleInfo!.toJson();
    }
    return data;
  }
}

class ScheduleInfo {
  String? id;
  String? tutorId;
  TutorDTO? tutorInfo;

  ScheduleInfo(
      {
      this.id,
      this.tutorId,
      this.tutorInfo});

  ScheduleInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tutorId = json['tutorId'];
    tutorInfo = json['tutorInfo'] != null
        ? TutorDTO.fromJson(json['tutorInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tutorId'] = tutorId;
    if (tutorInfo != null) {
      data['tutorInfo'] = tutorInfo!.toJson();
    }
    return data;
  }
}