import 'package:flutter/material.dart';
import 'package:let_tutor/widgets/app_bar.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/input_with_icon.dart';
import 'package:let_tutor/widgets/space.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar = Stack(
      alignment: Alignment.bottomRight,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.png'),
          radius: 50,
        ),
        Container(
          child: const Icon(
            Icons.camera_enhance,
            color: Colors.white,
            size: 25,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: Colors.grey,
          ),
          width: 30,
          height: 30,
        ),
      ],
    );

    Widget name = const Text(
      'Phạm Anh Đức',
      style: TextStyle(
        fontSize: 20,
      ),
    );

    Widget email = const Text('phamanhduc@gmail.com');

    Widget phone = createInputWithIcon(Icons.phone, 'Phone Number');

    Widget language = createInputWithIcon(Icons.language, 'Language');

    Widget location = createInputWithIcon(Icons.location_on, 'Location');

    Widget birthday = createInputWithIcon(Icons.cake, 'Birthday');

    Widget saveButton = createButtonExpanded('Save', action:  (){});

    return Scaffold(
      appBar: createAppBar('Profile', true, context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              avatar,
              space(20),
              name,
              space(20),
              email,
              space(20),
              phone,
              space(20),
              language,
              space(20),
              location,
              space(20),
              birthday,
              space(50),
              saveButton,
            ],
          ),
        ),
      ),
    );
  }
}
