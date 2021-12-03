import 'package:flutter/material.dart';
import 'package:let_tutor/ui/schedule/session_history/widgets/part.dart';
import 'package:let_tutor/widgets/space.dart';

class SessionHistoryItem extends StatelessWidget {
  const SessionHistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 0,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                  radius: 30,
                ),
                space(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pham Anh Duc',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    space(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Part(
                          icon: Icons.calendar_today,
                          name: '06:30:00, 04/10/2021',
                        ),
                        space(5),
                        const Part(
                          icon: Icons.alarm,
                          name: '00:11:37',
                        ),
                        space(5),
                        const Part(
                          icon: Icons.star_outline,
                          name: 'Not feedback yet',
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Give Feedback'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[50],
                    onPrimary: Colors.blue,
                  ),
                  onPressed: () {},
                  child: const Text('See Tutor Details'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
