
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
    user = json['User'] != null ? User.fromJson(json['User']) : null;
    isFavorite = json['isFavorite'];
    avgRating = (json['avgRating']).toDouble();
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    if (user != null) {
      data['User'] = user!.toJson();
    }
    data['isFavorite'] = isFavorite;
    data['avgRating'] = avgRating;
    data['price'] = price;
    return data;
  }

  convertLanguageCode() async {
    List<String> listLanguagePart = languages!.split(',');
    for (String language in listLanguagePart) {
      listLanguages.add(LanguageLocal.getDisplayLanguage(language));
    }
  }
}
