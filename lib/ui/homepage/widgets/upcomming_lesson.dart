import 'package:flutter/material.dart';
import 'package:let_tutor/widgets/space.dart';

class UpcommingLesson extends StatelessWidget {
  const UpcommingLesson({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}