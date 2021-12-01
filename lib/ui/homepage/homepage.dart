import 'package:flutter/material.dart';
import 'package:let_tutor/ui/Tutor/card_info.dart';
import 'package:let_tutor/ui/homepage/widgets/title.dart';
import 'package:let_tutor/ui/homepage/widgets/upcomming_lesson.dart';
import 'package:let_tutor/widgets/list_chip.dart';
import 'package:let_tutor/widgets/space.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget upcomingLesson = const UpcommingLesson();

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
      'KET'
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
              backgroundImage: AssetImage('assets/images/avatar.png'),
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
                  children: List.generate(5, (index) => const BriefInfoCard()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
