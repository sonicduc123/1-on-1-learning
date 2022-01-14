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
        ? new TutorCourse.fromJson(json['TutorCourse'])
        : null;
    if (json['topics'] != null) {
      topics = <Topics>[];
      json['topics'].forEach((v) {
        topics!.add(new Topics.fromJson(v));
      });
    }
    if (json['users'] != null) {
      users = <User>[];
      json['users'].forEach((v) {
        users!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['level'] = this.level;
    data['reason'] = this.reason;
    data['purpose'] = this.purpose;
    data['other_details'] = this.otherDetails;
    if (this.tutorCourse != null) {
      data['TutorCourse'] = this.tutorCourse!.toJson();
    }
    if (this.topics != null) {
      data['topics'] = this.topics!.map((v) => v.toJson()).toList();
    }
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    return data;
  }
}

class CourseMessage {
  String? message;
  CourseData? data;

  CourseMessage({this.message, this.data});

  CourseMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new CourseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
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
        courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.courses != null) {
      data['rows'] = this.courses!.map((v) => v.toJson()).toList();
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
    course = json['data'] != null ? new Courses.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.course != null) {
      data['data'] = this.course!.toJson();
    }
    return data;
  }
}