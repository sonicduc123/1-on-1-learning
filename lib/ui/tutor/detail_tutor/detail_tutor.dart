import 'package:flutter/material.dart';
import 'package:let_tutor/ui/tutor/detail_tutor/rating_and_comment.dart';
import 'package:let_tutor/widgets/app_bar.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/space.dart';

import 'Course/course.dart';
import 'header.dart';
import 'information_block.dart';
import 'information_chip.dart';
import 'information_field.dart';
import 'interaction_button.dart';

class DetailTutor extends StatelessWidget {
  const DetailTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header = DetailTutorHeader();

    Widget bookingButton = createButtonExpanded('Booking');

    Widget interactionButtons = Row(
      children: const [
        Expanded(
          child: InteractionButton(name: 'Message', icon: Icons.message),
        ),
        Expanded(
          child: InteractionButton(name: 'Report', icon: Icons.dangerous),
        ),
      ],
    );

    Widget description = Text(
      "Hello there! I am an Industrial Engineer in the profession but chose to do online teaching because I love to meet different learners. I am an outgoing person and I have this passion for dealing with different people and seeing them progress with my help as their teacher. In fact, making friends is one of my best skills. I am very good at adapting to new environments and new situations. I am very friendly and can easily get along well with everyone.\n\n I have obtained a 120-Hour TEFL Certificate. I get a variety of teaching techniques. I know that there are fast and not so fast learners. So don't worry, I will be with you every step of the way going at your own pace. Let's practice what you already know and add something new each day.\n\n With my skills and experiences, I can assure you that I can provide adequate English learning effectively and efficiently. Together, let's make English learning fun.",
      style: TextStyle(fontSize: 15),
    );

    Widget languages = InforChip(
      title: 'Languages',
      listChip: ['Vietnamese', 'English'],
    );

    Widget education = const InforBlock(
      field: 'Education',
      description:
          "Hello there! I am an Industrial Engineer in the profession but chose to do online teaching because I love to meet different learners. ",
    );

    Widget experience = const InforBlock(
      field: 'Experience',
      description:
          "I have been teaching English online since 2020 catering to Japanese and Chinese students.",
    );

    Widget interests = const InforBlock(
      field: 'Interests',
      description:
          "Cooking, Mingling with kids, Watch my small retail store, Travelling",
    );

    Widget profession = const InforBlock(
      field: 'Profession',
      description: 'Online English Teacher',
    );

    Widget specialties = const InforChip(
      title: 'Specialties',
      listChip: [
        'English for Business',
        'Conversational',
        'English for kids',
        'STARTERS',
        'MOVERS',
      ],
    );

    Widget course = Column(
      children: [
        InforField(title: 'Course'),
        Course(),
        space(10),
      ],
    );

    Widget ratingAndComment = Column(
      children: [
        InforField(title: 'Rating and Comment (3)'),
        Column(
          children: List.generate(
            3,
            (index) => Column(
              children: [
                space(10),
                RatingComment(),
              ],
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: createAppBar('Detail Information of Tutor', true, context),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              header,
              space(15),
              bookingButton,
              space(15),
              interactionButtons,
              space(20),
              description,
              space(20),
              languages,
              education,
              experience,
              interests,
              profession,
              specialties,
              course,
              ratingAndComment,
            ],
          ),
        ),
      ),
    );
  }
}
