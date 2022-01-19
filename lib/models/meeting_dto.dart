import 'package:let_tutor/models/user.dart';

class MeetingDTO {
  String? room;
  User? userCall;
  User? userBeCalled;

  MeetingDTO({
    this.room,
    this.userCall,
  });

  MeetingDTO.fromJson(Map<String, dynamic> json) {
    room = json['room'];
    userCall =
        json['userCall'] != null ? User.fromJson(json['userCall']) : null;
    userBeCalled = json['userBeCalled'] != null
        ? User.fromJson(json['userBeCalled'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['room'] = room;
    if (userCall != null) {
      data['userCall'] = userCall!.toJson();
    }
    if (userBeCalled != null) {
      data['userBeCalled'] = userBeCalled!.toJson();
    }
    return data;
  }
}
