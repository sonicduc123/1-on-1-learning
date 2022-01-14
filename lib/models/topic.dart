class Topics {
  String? id;
  String? courseId;
  int? orderCourse;
  String? name;
  String? nameFile;
  String? description;

  Topics(
      {this.id,
      this.courseId,
      this.orderCourse,
      this.name,
      this.nameFile,
      this.description,});

  Topics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['courseId'];
    orderCourse = json['orderCourse'];
    name = json['name'];
    nameFile = json['nameFile'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseId'] = this.courseId;
    data['orderCourse'] = this.orderCourse;
    data['name'] = this.name;
    data['nameFile'] = this.nameFile;
    data['description'] = this.description;
    return data;
  }
}