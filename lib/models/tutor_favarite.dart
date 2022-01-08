class FavoriteTutor {
  String? tutorID;

  FavoriteTutor(
      {
      this.tutorID,});

  FavoriteTutor.fromJson(Map<String, dynamic> json) {
    tutorID = json['secondId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secondId'] = this.tutorID;
    return data;
  }
}