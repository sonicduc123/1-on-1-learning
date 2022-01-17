import 'package:let_tutor/models/topic.dart';
import 'package:let_tutor/models/user.dart';

class Courses {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? level;
  String? reason;
  String? purpose;
  String? otherDetails;
  TutorCourse? tutorCourse;
  List<Topics>? topics;
  List<User>? users;

  Courses({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.reason,
    this.purpose,
    this.otherDetails,
    this.tutorCourse,
    this.users,
  });

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    level = json['level'];
    reason = json['reason'];
    purpose = json['purpose'];
    otherDetails = json['other_details'];
    tutorCourse = json['TutorCourse'] != null
        ? TutorCourse.fromJson(json['TutorCourse'])
        : null;
    if (json['topics'] != null) {
      topics = <Topics>[];
      json['topics'].forEach((v) {
        topics!.add(Topics.fromJson(v));
      });
    }
    if (json['users'] != null) {
      users = <User>[];
      json['users'].forEach((v) {
        users!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['level'] = level;
    data['reason'] = reason;
    data['purpose'] = purpose;
    data['other_details'] = otherDetails;
    if (tutorCourse != null) {
      data['TutorCourse'] = tutorCourse!.toJson();
    }
    if (topics != null) {
      data['topics'] = topics!.map((v) => v.toJson()).toList();
    }
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TutorCourse {
  String? userId;

  TutorCourse({
    this.userId,
  });

  TutorCourse.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    return data;
  }
}

class CourseMessage {
  String? message;
  CourseData? data;

  CourseMessage({this.message, this.data});

  CourseMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? CourseData.fromJson(json['data']) : null;
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

class CourseData {
  int? count;
  List<Courses>? courses;

  CourseData({this.count, this.courses});

  CourseData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      courses = <Courses>[];
      json['rows'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (courses != null) {
      data['rows'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseDetail {
  String? message;
  Courses? course;

  CourseDetail({this.message, this.course});

  CourseDetail.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    course = json['data'] != null ? Courses.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (course != null) {
      data['data'] = course!.toJson();
    }
    return data;
  }
}