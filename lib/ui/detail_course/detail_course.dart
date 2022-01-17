import 'package:flutter/material.dart';
import 'package:let_tutor/data/network/get_api.dart';
import 'package:let_tutor/models/course.dart';
import 'package:let_tutor/ui/course/widget/pdf_file.dart';
import 'package:let_tutor/ui/detail_course/widgets/heading.dart';
import 'package:let_tutor/ui/detail_course/widgets/label_item.dart';
import 'package:let_tutor/widgets/space.dart';

class DetailCourse extends StatefulWidget {
  const DetailCourse({Key? key, required this.courseID}) : super(key: key);

  final String courseID;

  @override
  _DetailCourseState createState() => _DetailCourseState();
}

class _DetailCourseState extends State<DetailCourse> {
  bool isLoading = true;
  Courses? course;

  @override
  void initState() {
    getCourseDetail();
    super.initState();
  }

  void getCourseDetail() async {
    setState(() {
      isLoading = true;
    });
    course = await GetAPI.getCourseDetail(widget.courseID);
    setState(() {
      isLoading = false;
    });
  }

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
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LabelItem(
                    number: isLoading ? '' : course!.topics!.length.toString(),
                    name: 'topics',
                    color: Colors.blue),
                LabelItem(
                    number: isLoading ? '' : course!.users!.length.toString(),
                    name: 'tutors',
                    color: Colors.black),
                LabelItem(
                    number: isLoading ? '' : course!.level!,
                    name: 'level',
                    color: Colors.green),
              ],
            ),
          ),
        ),
      ),
    );

    Widget name = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(title: 'Name'),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              isLoading ? '' : course!.name!,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        )
      ],
    );

    Widget aboutCourse = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(title: 'About course'),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              isLoading ? '' : course!.description!,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    );

    Widget overview = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(title: 'Overview'),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            "- Why take this course?\n" +
                (isLoading ? '' : course!.reason!) +
                "\n\n" +
                "- What will you be able to do?\n" +
                (isLoading ? '' : course!.purpose!),
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    );

    Widget topic = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(title: 'Topic'),
        space(10),
        Column(
          children: List.generate(
            isLoading ? 0 : course!.topics!.length,
            (index) => Card(
              elevation: 3,
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    index.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Text(
                  isLoading ? '' : course!.topics![index].name!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => isLoading
                            ? Container()
                            : PDFView(
                                url: course!.topics![index].nameFile!,
                                name: course!.topics![index].name!,
                              ))),
              ),
            ),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: isLoading
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(course!.imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    label,
                    name,
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
