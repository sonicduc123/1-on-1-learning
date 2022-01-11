import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/tutor_detail.dart';
import 'package:let_tutor/utils/handle_error_fetch.dart';
import 'package:let_tutor/widgets/rating_star.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef FavoriteCallback = void Function();

class DetailTutorHeader extends StatefulWidget {
  const DetailTutorHeader(
      {Key? key, required this.tutor, required this.callback})
      : super(key: key);

  final TutorDetail tutor;
  final FavoriteCallback callback;

  @override
  _DetailTutorHeaderState createState() => _DetailTutorHeaderState();
}

class _DetailTutorHeaderState extends State<DetailTutorHeader> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  onPressFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response response = await post(
      Uri.parse(Endpoints.addFavorite),
      headers: {
        "Authorization": "Bearer " + prefs.getString("accessToken")!,
      },
      body: {
        "tutorId": widget.tutor.userId,
      },
    );
    if (response.statusCode != 200) {
      handleErrorFetch(response.body, context);
    }
    setState(() {
      widget.tutor.isFavorite = !widget.tutor.isFavorite!;
    });
    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.tutor.user!.avatar!),
          radius: 45,
        ),
        space(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space(10),
              Text(
                widget.tutor.user!.name!,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              space(10),
              const Text(
                'Teacher',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              space(10),
              Text(widget.tutor.user!.country!),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: widget.tutor.isFavorite!
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_outline),
              color: Colors.blue,
              iconSize: 30,
              onPressed: () => onPressFavorite(),
            ),
            space(30),
            RatingStar(rating: widget.tutor.avgRating!.toInt()),
          ],
        )
      ],
    );
  }
}
