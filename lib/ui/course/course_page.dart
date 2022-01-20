import 'dart:developer';

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
  ScrollController scrollController = ScrollController();
  bool isLoading = true;
  int page = 0;
  final int size = 8;

  @override
  void initState() {
    getListCourse();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getListCourse();
      }
    });
    super.initState();
  }

  void getListCourse() async {
    setState(() {
      isLoading = true;
    });
    page++;
    List<Courses> listCourseAPI =
        await GetAPI.getListCourse(page, size, searchController.text);
    listCourse.addAll(listCourseAPI);
    setState(() {
      listSearchCourse = listCourse.sublist(0);
      isLoading = false;
    });
    log(listSearchCourse.length.toString());
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
              onSubmitted: (value) => {
                log(value),
                setState(() {
                  page = 0;
                  listCourse = [];
                  scrollController.animateTo(0,
                      duration: const Duration(seconds: 2),
                      curve: Curves.ease); // for (var course in listCourse) {
                  //   if (TiengViet.parse(course.name!)
                  //       .toLowerCase()
                  //       .contains(value.toLowerCase())) {
                  //     listSearchCourse.add(course);
                  //   }
                  // }
                }),
                getListCourse()
              },
            ),
            space(20),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: List.generate(
                    listSearchCourse.length + 1,
                    (index) => index == listSearchCourse.length
                        ? isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : listSearchCourse.isNotEmpty
                                ? Container()
                                : const Text('There is no course in system')
                        : Course(
                            course: listSearchCourse[index],
                          ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
