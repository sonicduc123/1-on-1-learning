import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:let_tutor/models/tutor_dto.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/widgets/list_chip.dart';
import 'package:let_tutor/widgets/rating_star.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:country_codes/country_codes.dart';

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
                      CircleAvatar(
                        backgroundImage: NetworkImage(tutor.avatar!),
                        radius: 30,
                      ),
                      space(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tutor.name!,
                              style: TextStyle(fontSize: 17),
                            ),
                            RatingStar(
                              rating: tutor.rating,
                            ),
                            createListChip(tutor.specialties!.split(','))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    tutor.bio!,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              !tutor.isFavarite
                  ? const Icon(
                      Icons.favorite_outline,
                      color: Colors.blue,
                      size: 35,
                    )
                  : const Icon(
                      Icons.favorite,
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
