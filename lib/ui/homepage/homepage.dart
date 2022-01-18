
import 'package:flutter/material.dart';
import 'package:let_tutor/constants/bottom_bar.dart';
import 'package:let_tutor/constants/chips.dart';
import 'package:let_tutor/models/schedule.dart';
import 'package:let_tutor/models/tutor_dto.dart';
import 'package:let_tutor/models/tutors.dart';
import 'package:let_tutor/models/user.dart';
import 'package:let_tutor/ui/account/profile.dart';
import 'package:let_tutor/ui/homepage/widgets/title.dart';
import 'package:let_tutor/ui/homepage/widgets/upcomming_lesson.dart';
import 'package:let_tutor/widgets/card_info.dart';
import 'package:let_tutor/widgets/list_chip.dart';
import 'package:let_tutor/widgets/space.dart';

typedef TabBarCallback = void Function(int tabIndex);
typedef UserChangeCallback = void Function(User user);

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key,
      required this.callback,
      required this.user,
      required this.userChangeCallback,
      required this.listSchedule,
      required this.listTutor,
      })
      : super(key: key);

  final TabBarCallback callback;
  final User user;
  final UserChangeCallback userChangeCallback;
  final List<Schedule> listSchedule;
  final List<TutorDTO> listTutor;


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexChip = 0;
  List<TutorDTO> listFilterTutor = [];

  @override
  void initState() {
    listFilterTutor = widget.listTutor.sublist(0);
    super.initState();
  }

  List<String> listChip = Chips.listChip;

  listChipCallback(int newIndexChip) {
    setState(
      () {
        indexChip = newIndexChip;
        if (newIndexChip == 0) {
          listFilterTutor = widget.listTutor.sublist(0);
          return;
        }
        listFilterTutor = [];
        for (TutorDTO tutor in widget.listTutor) {
          List<String> listSpecialties = tutor.specialties!.split(",");
          if (listSpecialties.contains(listChip[newIndexChip].toLowerCase())) {
            listFilterTutor.add(tutor);
          }
        }
      },
    );
  }

  favoriteCallback() {
    setState(() {
      widget.listTutor.sort((a, b) => sortListTutor(a, b));
      listFilterTutor.sort((a, b) => sortListTutor(a, b));
    });
  }

  @override
  Widget build(BuildContext context) {
    // user = context.watch<User>();
    // log(user!.name!);
    // log(user!.avatar!);
  Widget upcomingLesson = UpcomingLesson(listSchedule: widget.listSchedule, tabBarCallback: widget.callback,);

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(user: widget.user, callback: widget.userChangeCallback)));
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.user.avatar!),
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
                  children: List.generate(
                      listFilterTutor.length,
                      (index) => BriefInfoCard(
                            tutor: listFilterTutor[index],
                            callback: favoriteCallback,
                          )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
