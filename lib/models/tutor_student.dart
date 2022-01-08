class Student {
  String? avatar;
  String? name;

  Student(
      {
      this.avatar,
      this.name,
     });

  Student.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    return data;
  }
}