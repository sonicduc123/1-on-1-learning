import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:let_tutor/models/tutor_dto.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/widgets/list_chip.dart';
import 'package:let_tutor/widgets/rating_star.dart';
import 'package:let_tutor/widgets/space.dart';

class BriefInfoCard extends StatelessWidget {
  const BriefInfoCard({Key? key, required this.tutor}) : super(key: key);

  final TutorDTO tutor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 5,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        radius: 30,
                      ),
                      space(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tutor.name,
                              style: TextStyle(fontSize: 17),
                            ),
                            RatingStar(
                              rating: tutor.rating,
                            ),
                            createListChip(['English'])
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "I have been teaching English as a second language for kids, teenagers and adults for 5 years. I can help you gain a stronger foundation in English before furthering your studies. I'm patient, will speak slowly and clearly so don't hesitate to ask for good understanding.",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              const Icon(
                Icons.favorite_outline,
                color: Colors.blue,
                size: 35,
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, Routes.detailTutor);
        },
      ),
    );
  }
}
