import 'dart:developer';

import 'package:let_tutor/models/tutor_dto.dart';
import 'package:let_tutor/models/tutor_favarite.dart';

class Tutors {
  int? count;
  List<TutorDTO>? listTutor;

  Tutors({this.count, this.listTutor});

  Tutors.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      listTutor = <TutorDTO>[];
      json['rows'].forEach((v) {
        listTutor!.add(TutorDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (listTutor != null) {
      data['rows'] = listTutor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TutorsInfo {
  Tutors? tutors;
  List<FavoriteTutor>? favoriteTutor;

  TutorsInfo({this.tutors, this.favoriteTutor});

  TutorsInfo.fromJson(Map<String, dynamic> json) {
    tutors = json['tutors'] != null ? Tutors.fromJson(json['tutors']) : null;
    if (json['favoriteTutor'] != null) {
      favoriteTutor = <FavoriteTutor>[];
      json['favoriteTutor'].forEach((v) {
        favoriteTutor!.add(FavoriteTutor.fromJson(v));
      });
    }
    List<FavoriteTutor> favorites = favoriteTutor!.sublist(0);
    for (TutorDTO tutor in tutors!.listTutor!) {
      for (int i = 0; i < favorites.length; i++) {
        if (favorites[i].tutorID == tutor.userId) {
          tutor.isFavarite = true;
          favorites.removeAt(i);
          continue;
        }
      }
    }

    tutors!.listTutor!.sort((a, b) => sortListTutor(a, b));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tutors != null) {
      data['tutors'] = this.tutors!.toJson();
    }
    if (favoriteTutor != null) {
      data['favoriteTutor'] = favoriteTutor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

sortListTutor(TutorDTO a, TutorDTO b) {
  if (a.isFavarite && !b.isFavarite) {
    return -1;
  }
  if (b.isFavarite && !a.isFavarite) {
    return 1;
  }

  return -a.rating.compareTo(b.rating);
}
