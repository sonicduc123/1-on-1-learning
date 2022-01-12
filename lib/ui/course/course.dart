import 'package:flutter/material.dart';
import 'package:let_tutor/models/course.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/space.dart';

class Course extends StatelessWidget {
  const Course({Key? key, required this.courses}) : super(key: key);

  final Courses courses;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      width: 400,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(courses.imageUrl!),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courses.name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  space(10),
                  Text(
                    courses.description!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  space(10),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Level ' + courses.level!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  space(10),
                  createButtonExpanded('Explore', action: () {
                    Navigator.pushNamed(context, Routes.detailCourse);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
