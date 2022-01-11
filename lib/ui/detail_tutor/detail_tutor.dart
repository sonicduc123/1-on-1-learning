import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/tutor_detail.dart';
import 'package:let_tutor/ui/course/course.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/header.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/information_block.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/information_chip.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/information_field.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/interaction_button.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/rating_and_comment.dart';
import 'package:let_tutor/utils/handle_error_fetch.dart';
import 'package:let_tutor/widgets/app_bar.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef FavoriteCallback = void Function();

class DetailTutor extends StatefulWidget {
  const DetailTutor({Key? key, required this.tutorId, required this.callback})
      : super(key: key);

  final String tutorId;
  final FavoriteCallback callback;

  @override
  _DetailTutorState createState() => _DetailTutorState();
}

class _DetailTutorState extends State<DetailTutor> {
  TutorDetail? tutorDetail;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    getDetailTutor();
    super.initState();
  }

  void getDetailTutor() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response response = await get(
      Uri.parse(Endpoints.getTutor + widget.tutorId),
      headers: {
        "Authorization": "Bearer " + prefs.getString('accessToken')!,
      },
    );
    if (response.statusCode != 200) {
      handleErrorFetch(response.body, context);
    }
    tutorDetail = TutorDetail.fromJson(jsonDecode(response.body));
    await tutorDetail!.user!.convertCountryCode();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header = (!isLoading)
        ? DetailTutorHeader(
            tutor: tutorDetail!,
            callback: widget.callback,
          )
        : Container();

    Widget bookingButton = createButtonExpanded('Booking', action: () {});

    // Widget interactionButtons = Row(
    //   children: const [
    //     Expanded(
    //       child: InteractionButton(name: 'Message', icon: Icons.message),
    //     ),
    //     Expanded(
    //       child: InteractionButton(name: 'Report', icon: Icons.dangerous),
    //     ),
    //   ],
    // );

    Widget description = Text(
      !isLoading ? tutorDetail!.bio! : "",
      style: TextStyle(fontSize: 15),
    );

    Widget languages = InforChip(
      title: 'Languages',
      listChip: isLoading ? [] : tutorDetail!.listLanguages,
    );

    Widget education = InforBlock(
        field: 'Education',
        description: isLoading ? "" : tutorDetail!.education!);

    Widget experience = InforBlock(
        field: 'Experience',
        description: isLoading ? "" : tutorDetail!.experience!);

    Widget interests = InforBlock(
        field: 'Interests',
        description: isLoading ? "" : tutorDetail!.interests!);

    Widget profession = InforBlock(
      field: 'Profession',
      description: isLoading ? "" : tutorDetail!.profession!,
    );

    Widget specialties = InforChip(
      title: 'Specialties',
      listChip: isLoading ? [] : tutorDetail!.specialties!.split(','),
    );

    Widget course = isLoading
        ? Container()
        : tutorDetail!.user!.courses!.isNotEmpty
            ? Column(
                children: [
                  InforField(title: 'Course'),
                  Column(
                    children: List.generate(
                      tutorDetail!.user!.courses!.length,
                      (index) => Course(courses: tutorDetail!.user!.courses![index],),
                    ),
                  )
                ],
              )
            : Container();

    Widget ratingAndComment = isLoading
        ? Container()
        : Column(
            children: [
              InforField(
                  title: 'Rating and Comment (' +
                      tutorDetail!.user!.feedbacks!.length.toString() +
                      ')'),
              Column(
                children: List.generate(
                  tutorDetail!.user!.feedbacks!.length,
                  (index) => Column(
                    children: [
                      space(10),
                      RatingComment(
                        feedbacks: tutorDetail!.user!.feedbacks![index],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );

    return Scaffold(
      appBar: createAppBar('Detail Information of Tutor', true, context),
      body: !isLoading
          ? Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    header,
                    space(15),
                    bookingButton,
                    space(15),
                    //interactionButtons,
                    space(20),
                    description,
                    space(20),
                    languages,
                    education,
                    experience,
                    interests,
                    profession,
                    specialties,
                    course,
                    ratingAndComment,
                  ],
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
