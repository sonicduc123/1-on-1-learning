import 'package:let_tutor/models/tutor_feedback.dart';

class TutorDTO {
  String? avatar;
  String? name;
  String? country;
  List<Feedbacks>? feedbacks;
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? interests;
  String? languages;
  String? specialties;
  bool? isOnline;
  bool isFavarite = false;
  int rating = 0;

  TutorDTO(
      {this.avatar,
      this.name,
      this.country,
      this.feedbacks,
      this.id,
      this.userId,
      this.video,
      this.bio,
      this.education,
      this.experience,
      this.profession,
      this.interests,
      this.languages,
      this.specialties,
      this.isOnline});

  TutorDTO.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    if (json['feedbacks'] != null) {
      feedbacks = <Feedbacks>[];
      json['feedbacks'].forEach((v) {
        feedbacks!.add(new Feedbacks.fromJson(v));
      });
    }
    id = json['id'];
    userId = json['userId'];
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    interests = json['interests'];
    languages = json['languages'];
    specialties = json['specialties'];
    isOnline = json['isOnline'];
    rating = calculateRating();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['country'] = this.country;
    if (this.feedbacks != null) {
      data['feedbacks'] = this.feedbacks!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['userId'] = userId;
    data['video'] = this.video;
    data['bio'] = this.bio;
    data['education'] = this.education;
    data['experience'] = this.experience;
    data['profession'] = this.profession;
    data['interests'] = this.interests;
    data['languages'] = this.languages;
    data['specialties'] = this.specialties;
    data['isOnline'] = this.isOnline;
    return data;
  }

  int calculateRating() {
    int sum = 0;
    for (var feedback in feedbacks!) {
      sum += feedback.rating!;
    }
    double average = sum / feedbacks!.length;
    return average.toInt();
  }
}
