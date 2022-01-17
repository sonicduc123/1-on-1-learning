import 'package:flutter/material.dart';
import 'package:let_tutor/data/network/get_api.dart';
import 'package:let_tutor/models/tutor_detail.dart';
import 'package:let_tutor/ui/course/course.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/header.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/information_block.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/information_chip.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/information_field.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/rating_and_comment.dart';
import 'package:let_tutor/ui/detail_tutor/widgets/video_infor.dart';
import 'package:let_tutor/widgets/app_bar.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/space.dart';

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
    getDetailTutor();
    super.initState();
  }

  void getDetailTutor() async {
    setState(() {
      isLoading = true;
    });

    tutorDetail = await GetAPI.getTutorDetail(widget.tutorId);

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
    Widget video = isLoading
        ? Container()
        : VideoInfor(
            videoUrl: tutorDetail!.video!,
          );

    Widget description = Text(
      !isLoading ? tutorDetail!.bio! : "",
      style: const TextStyle(fontSize: 15),
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
                  const InforField(title: 'Course'),
                  Column(
                    children: List.generate(
                      tutorDetail!.user!.courses!.length,
                      (index) => Course(
                        course: tutorDetail!.user!.courses![index],
                      ),
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
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    header,
                    space(15),
                    bookingButton,
                    space(15),
                    video,
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
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
