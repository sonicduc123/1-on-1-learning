import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef UserChangeCallback = Function(User user);

class Avatar extends StatefulWidget {
  const Avatar({Key? key, required this.user, required this.callback})
      : super(key: key);
  final User user;
  final UserChangeCallback callback;

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool isPickImage = false;
  late File imageFile;

  getFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        uploadAvatar();
        isPickImage = true;
      });
    }
  }

  uploadAvatar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //create multipart request for POST or PATCH method
    MultipartRequest request =
        MultipartRequest("POST", Uri.parse(Endpoints.uploadAvatar));
    request.headers["Authorization"] =
        "Bearer " + prefs.getString("accessToken")!;
    //create multipart using filepath, string or bytes
    MultipartFile pic = await MultipartFile.fromPath("avatar", imageFile.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();
    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    User u = User.fromJson(jsonDecode(responseString));
    widget.callback(u);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        isPickImage
            ? CircleAvatar(
                backgroundImage: FileImage(imageFile),
                radius: 50,
              )
            : CircleAvatar(
                backgroundImage: NetworkImage(widget.user.avatar!),
                radius: 50,
              ),
        Container(
          child: IconButton(
            icon: const Icon(Icons.camera_enhance),
            color: Colors.white,
            iconSize: 20,
            onPressed: () {
              getFromGallery();
            },
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.grey),
          width: 35,
          height: 35,
        ),
      ],
    );
  }
}
