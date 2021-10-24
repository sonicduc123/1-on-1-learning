import 'package:flutter/material.dart';
import 'package:let_tutor/Ultility/space.dart';

class UpcomingItem extends StatelessWidget {
  const UpcomingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      elevation: 0,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                  radius: 30,
                ),
                space(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pham Anh Duc',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    space(10),
                    Row(
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
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[200],
                    onPrimary: Colors.blue,
                  ),
                  onPressed: () {},
                  child: Text('Cancel'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Go to Meeting'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
