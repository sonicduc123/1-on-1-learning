import 'package:flutter/material.dart';
import 'package:let_tutor/Ultility/list_chip.dart';
import 'package:let_tutor/Ultility/rating_start.dart';
import 'package:let_tutor/Ultility/space.dart';

class BriefInfoCard extends StatelessWidget {
  const BriefInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/avatar.png'),
                  radius: 30,
                ),
                space(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phạm Anh Đức',
                        style: TextStyle(fontSize: 17),
                      ),
                      RatingStart(),
                      createListChip(['English'])
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Icon(Icons.favorite_outline, color: Colors.blue),
                  ],
                ),
              ],
            ),
            Text(
              "I have been teaching English as a second language for kids, teenagers and adults for 5 years. I can help you gain a stronger foundation in English before furthering your studies. I'm patient, will speak slowly and clearly so don't hesitate to ask for good understanding.",
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
