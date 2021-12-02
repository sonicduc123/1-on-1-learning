import 'package:flutter/material.dart';
import 'package:let_tutor/ui/detail_course/widgets/heading.dart';
import 'package:let_tutor/ui/detail_course/widgets/label_item.dart';

class DetailCourse extends StatelessWidget {
  const DetailCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget label = Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 250,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                LabelItem(number: '10', name: 'topics', color: Colors.blue),
                LabelItem(number: '1', name: 'tutors', color: Colors.black),
                LabelItem(number: '4', name: 'level', color: Colors.green),
              ],
            ),
          ),
        ),
      ),
    );

    Widget aboutCourse = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(title: 'About course'),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'The English you need for your work and career',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );

    Widget overview = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(title: 'Overview'),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "- Why take this course\nUnderstanding business culture and customs is just as important as learning traditional business-related vocabulary. With Cambly's Business English course, you have the chance to learn from expertly-crafted lessons as well as from your tutor's personal experiences.\n\n- What will you be able to do\nThis course covers the most common vocabulary and grammatical structures needed to do business in English. The course focuses on simulating real-life business situations to build professional communicative competency. You will also learn idioms being used in English-speaking offices across the globe.",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );

    Widget topic = Column(
      children: [
        Heading(title: 'Topic'),
        Column(
          children: List.generate(
            10,
            (index) => Card(
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    index.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Text(
                  'Topic ' + index.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/course.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              label,
              aboutCourse,
              overview,
              topic,
            ],
          ),
        ),
      ),
    );
  }
}
