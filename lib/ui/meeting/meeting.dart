import 'package:flutter/material.dart';
import 'package:let_tutor/widgets/space.dart';

class Meeting extends StatelessWidget {
  const Meeting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header = const Text('Tutoring Meeting Room  00:23');

    Widget timer = Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text('Lesson will be started after'),
          space(10),
          const Text(
            '15 : 43 : 49',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );

    Widget avatar = const CircleAvatar(
      backgroundImage: AssetImage('assets/images/avatar.png'),
      radius: 80,
    );

    Widget status = const Text('You are the only one in the meeting');

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  header,
                  space(50),
                  timer,
                  space(80),
                  avatar,
                  space(200),
                  status,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
