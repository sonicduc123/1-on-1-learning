import 'package:let_tutor/models/tutor_student.dart';

class Feedbacks {
  String? id;
  int? rating;
  String? content;
  String? createdAt;
  Student? student;

  Feedbacks(
      {this.id, this.rating, this.content, this.createdAt, this.student});

  Feedbacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    content = json['content'];
    createdAt = json['createdAt'];
    student = json['firstInfo'] != null
        ? new Student.fromJson(json['firstInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    if (this.student != null) {
      data['firstInfo'] = this.student!.toJson();
    }
    return data;
  }
}
