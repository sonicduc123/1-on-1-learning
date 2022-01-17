import 'dart:developer';

import 'package:country_codes/country_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:let_tutor/models/course.dart';
import 'package:let_tutor/models/tutor_feedback.dart';

class User extends ChangeNotifier {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? isActivated;
  int? timezone;
  List<Feedbacks>? feedbacks;
  List<Courses>? courses;

  User(
      {this.id,
      this.email,
      this.name,
      this.avatar,
      this.country,
      this.phone,
      this.language,
      this.birthday,
      this.isActivated,
      this.timezone,
      this.feedbacks,
      this.courses});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    language = json['language'];
    birthday = json['birthday'];
    isActivated = json['isActivated'];
    timezone = json['timezone'];
    if (json['feedbacks'] != null) {
      feedbacks = <Feedbacks>[];
      json['feedbacks'].forEach((v) {
        feedbacks!.add(Feedbacks.fromJson(v));
      });
    }
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['avatar'] = avatar;
    data['country'] = country;
    data['phone'] = phone;
    data['language'] = language;
    data['birthday'] = birthday;
    data['isActivated'] = isActivated;
    data['timezone'] = timezone;
    if (feedbacks != null) {
      data['feedbacks'] = feedbacks!.map((v) => v.toJson()).toList();
    }
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<void> convertCountryCode() async {
    await CountryCodes.init();
    if (country != null) {
      Locale local = Locale('en', country);
      country = CountryCodes.detailsForLocale(local).localizedName;
    }
  }

  void changeNotify() {
    notifyListeners();
    log('notify listener');
  }
}

class UserInfor extends ChangeNotifier {
  User? user;

  UserInfor({this.user});

  UserInfor.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  void changeNotify() {
    notifyListeners();
    user!.changeNotify();
  }
}
