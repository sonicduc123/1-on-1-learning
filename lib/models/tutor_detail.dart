import 'dart:developer';

import 'package:country_codes/country_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:let_tutor/constants/language_code.dart';
import 'package:let_tutor/models/user.dart';

class TutorDetail {
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? interests;
  String? languages;
  List<String> listLanguages = [];
  String? specialties;
  User? user;
  bool? isFavorite;
  double? avgRating;
  int? price;

  TutorDetail(
      {this.id,
      this.userId,
      this.video,
      this.bio,
      this.education,
      this.experience,
      this.profession,
      this.interests,
      this.languages,
      this.specialties,
      this.user,
      this.isFavorite,
      this.avgRating,
      this.price});

  TutorDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    interests = json['interests'];
    languages = json['languages'];
    convertLanguageCode();
    specialties = json['specialties'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    isFavorite = json['isFavorite'];
    avgRating = (json['avgRating']).toDouble();
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['video'] = this.video;
    data['bio'] = this.bio;
    data['education'] = this.education;
    data['experience'] = this.experience;
    data['profession'] = this.profession;
    data['interests'] = this.interests;
    data['languages'] = this.languages;
    data['specialties'] = this.specialties;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    data['isFavorite'] = this.isFavorite;
    data['avgRating'] = this.avgRating;
    data['price'] = this.price;
    return data;
  }

  convertLanguageCode() async {
    List<String> listLanguagePart = languages!.split(',');
    for (String language in listLanguagePart) {
      listLanguages.add(LanguageLocal.getDisplayLanguage(language));
    }
  }
}
