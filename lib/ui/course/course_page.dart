
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/data/network/get_api.dart';
import 'package:let_tutor/models/course.dart';
import 'package:let_tutor/ui/course/course.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:tiengviet/tiengviet.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List<Courses> listCourse = [];
  List<Courses> listSearchCourse = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    getListCourse();
    super.initState();
  }

  void getListCourse() async {
    setState(() {
      isLoading = true;
    });
    List<Courses> listCourseAPI = await GetAPI.getListCourse();
    setState(() {
      listCourse = listCourseAPI;
      listSearchCourse = listCourse.sublist(0);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            CupertinoSearchTextField(
              controller: searchController,
              placeholder: 'Search courses by name',
              padding: const EdgeInsets.all(8),
              prefixIcon: const Icon(Icons.search),
              onChanged: (value) => {
                setState(() {
                  listSearchCourse = [];
                  for (var course in listCourse) {
                    if (TiengViet.parse(course.name!)
                        .toLowerCase()
                        .contains(value.toLowerCase())) {
                      listSearchCourse.add(course);
                    }
                  }
                })
              },
            ),
            space(20),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : listSearchCourse.isNotEmpty
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                              listSearchCourse.length,
                              (index) => Course(
                                course: listSearchCourse[index],
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Text('There is no course in system'),
          ],
        ),
      ),
    );
  }
}
