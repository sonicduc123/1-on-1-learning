import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:let_tutor/constants/bottom_bar.dart';
import 'package:let_tutor/constants/chips.dart';
import 'package:let_tutor/models/tutor_dto.dart';
import 'package:let_tutor/models/tutors.dart';
import 'package:let_tutor/models/user.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/homepage/widgets/title.dart';
import 'package:let_tutor/ui/homepage/widgets/upcomming_lesson.dart';
import 'package:let_tutor/widgets/card_info.dart';
import 'package:let_tutor/widgets/list_chip.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:provider/src/provider.dart';

typedef TabBarCallback = void Function(int tabIndex);

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.callback}) : super(key: key);

  final TabBarCallback callback;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexChip = 0;
  List<TutorDTO> listFilterTutor = [];
  List<TutorDTO> listTutor = [];
  UserInfor? userInfor; 
     

  @override
  void initState() {
    // TODO: implement initState
    listTutor = context.read<List<TutorDTO>>();
    listFilterTutor = listTutor.sublist(0);
    userInfor = context.read<UserInfor>();
    super.initState();
  }

  Widget upcomingLesson = const UpcommingLesson();
  List<String> listChip = Chips.listChip;

  @override
  Widget build(BuildContext context) {
    listChipCallback(int newIndexChip) {
      setState(() {
        indexChip = newIndexChip;
        if (newIndexChip == 0) {
          listFilterTutor = listTutor.sublist(0);
          return;
        }
        listFilterTutor = [];
        for (TutorDTO tutor in listTutor) {
          List<String> listSpecialties = tutor.specialties!.split(",");
          if (listSpecialties.contains(listChip[newIndexChip].toLowerCase())) {
            listFilterTutor.add(tutor);
          }
        }
      });
    }

    Widget listSpecialities =
        ListChip(listChip: listChip, callback: listChipCallback);

    Widget headingRecommentTutor = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Heading(title: 'Recommended tutors'),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            TextButton(
                onPressed: () {
                  widget.callback(BottomBars.tutor);
                },
                child: const Text('See all')),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
              size: 10,
            ),
          ],
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Container(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.profile);
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(userInfor!.user!.avatar!),
              ),
            ),
            margin: const EdgeInsets.only(right: 10),
          ),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          upcomingLesson,
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(
              children: [
                const Heading(title: 'Find a tutor'),
                space(5),
                listSpecialities,
                headingRecommentTutor,
                Column(
                  children: List.generate(listFilterTutor.length,
                      (index) => BriefInfoCard(tutor: listFilterTutor[index])),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
