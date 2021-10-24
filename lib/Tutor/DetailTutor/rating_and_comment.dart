import 'package:flutter/material.dart';
import 'package:let_tutor/Ultility/rating_start.dart';
import 'package:let_tutor/Ultility/space.dart';

class RatingComment extends StatelessWidget {
  const RatingComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
                radius: 25,
              ),
              space(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pham Anh Duc',
                      style: TextStyle(fontSize: 16),
                    ),
                    space(5),
                    Text("wow, it's great"),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  RatingStart(),
                  Text(
                    '18:53:00, 24/10/2021',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
