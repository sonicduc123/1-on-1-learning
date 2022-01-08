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
        listTutor!.add(new TutorDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.listTutor != null) {
      data['rows'] = this.listTutor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TutorsInfo {
  Tutors? tutors;
  List<FavoriteTutor>? favoriteTutor;

  TutorsInfo({this.tutors, this.favoriteTutor});

  TutorsInfo.fromJson(Map<String, dynamic> json) {
    tutors =
        json['tutors'] != null ? new Tutors.fromJson(json['tutors']) : null;
    if (json['favoriteTutor'] != null) {
      favoriteTutor = <FavoriteTutor>[];
      json['favoriteTutor'].forEach((v) {
        favoriteTutor!.add(new FavoriteTutor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tutors != null) {
      data['tutors'] = this.tutors!.toJson();
    }
    if (this.favoriteTutor != null) {
      data['favoriteTutor'] =
          this.favoriteTutor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}