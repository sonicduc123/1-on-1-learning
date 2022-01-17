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
  bool isFavorite = false;
  int rating = 0;

  TutorDTO({
    this.avatar,
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
    this.isOnline,
  });

  TutorDTO.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    if (json['feedbacks'] != null) {
      feedbacks = <Feedbacks>[];
      json['feedbacks'].forEach((v) {
        feedbacks!.add(Feedbacks.fromJson(v));
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['name'] = name;
    data['country'] = country;
    if (feedbacks != null) {
      data['feedbacks'] = feedbacks!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['userId'] = userId;
    data['video'] = video;
    data['bio'] = bio;
    data['education'] = education;
    data['experience'] = experience;
    data['profession'] = profession;
    data['interests'] = interests;
    data['languages'] = languages;
    data['specialties'] = specialties;
    data['isOnline'] = isOnline;
    return data;
  }

  int calculateRating() {
    int sum = 0;
    double average = 0;
    if (feedbacks != null) {
      for (var feedback in feedbacks!) {
        sum += feedback.rating!;
      }
      average = sum / feedbacks!.length;
    }
    return average.toInt();
  }
}
