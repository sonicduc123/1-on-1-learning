import 'package:flutter/material.dart';

class BookingHistoryItem extends StatelessWidget {
  const BookingHistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.png'),
          radius: 30,
        ),
        title: const Text('Pham Anh Duc'),
        subtitle: Row(
          children: const [
            Text('2021-10-06   '),
            Text(
              '06:30',
              style: TextStyle(color: Colors.blue),
            ),
            Text(' - '),
            Text(
              '07:00',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
