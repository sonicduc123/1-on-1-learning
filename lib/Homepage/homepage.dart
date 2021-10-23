import 'package:flutter/material.dart';
import 'package:let_tutor/Homepage/title.dart';
import 'package:let_tutor/Ultility/card_info.dart';
import 'package:let_tutor/Ultility/list_chip.dart';
import 'package:let_tutor/Ultility/space.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget upcomingLesson = Container(
      child: Column(
        children: [
          const Text(
            'Total lesson time is 11 hours 46 minustes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          space(10),
          const Text(
            'Upcoming Lesson',
            style: TextStyle(color: Colors.white),
          ),
          space(10),
          const Text(
            'Wed, 06 Oct 21 06:03 - 06:55',
            style: TextStyle(color: Colors.white),
          ),
          space(10),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Enter lesson room',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
      color: Colors.blue,
      padding: const EdgeInsets.all(30),
    );

    List<String> listChip = [
      'Kids',
      'Business',
      'IELTS',
      'TOEFL',
      'STARTERS',
      'Conversational',
      'STARTERS',
      'MOVERS',
      'PET',
      'KET',
    ];
    Widget listSpecialities = createListChip(listChip);

    Widget headingRecommentTutor = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Heading(title: 'Recommended tutors'),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            TextButton(onPressed: () {}, child: Text('See all')),
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
            child: const CircleAvatar(
              backgroundImage: AssetImage('images/avatar.png'),
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
                listSpecialities,
                headingRecommentTutor,
                BriefInfoCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
