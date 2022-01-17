
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/tutor_dto.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/detail_tutor/models/detail_tutor_argument.dart';
import 'package:let_tutor/utils/handle_error_fetch.dart';
import 'package:let_tutor/widgets/list_chip.dart';
import 'package:let_tutor/widgets/rating_star.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef FavoriteCallback = void Function();
typedef DetailFavoriteCallback = void Function();

class BriefInfoCard extends StatefulWidget {
  const BriefInfoCard({Key? key, required this.tutor, required this.callback})
      : super(key: key);

  final TutorDTO tutor;
  final FavoriteCallback callback;

  @override
  _BriefInfoCardState createState() => _BriefInfoCardState();
}

class _BriefInfoCardState extends State<BriefInfoCard> {
  void onPressFavorite() async {
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
      widget.tutor.isFavorite = !widget.tutor.isFavorite;
    });
    widget.callback();
  }

  favoriteDetailCallback() {
    setState(() {
      widget.tutor.isFavorite = !widget.tutor.isFavorite;
    });
    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    DetailTutorArgument args =
        DetailTutorArgument(widget.tutor.userId!, favoriteDetailCallback);
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
                        backgroundImage: NetworkImage(widget.tutor.avatar!),
                        radius: 30,
                      ),
                      space(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.tutor.name!,
                              style: const TextStyle(fontSize: 17),
                            ),
                            RatingStar(
                              rating: widget.tutor.rating,
                            ),
                            createListChip(widget.tutor.specialties!.split(','))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.tutor.bio!,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              IconButton(
                icon: !widget.tutor.isFavorite
                    ? const Icon(Icons.favorite_outline)
                    : const Icon(Icons.favorite),
                color: Colors.blue,
                iconSize: 35,
                onPressed: () => onPressFavorite(),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, Routes.detailTutor, arguments: args);
        },
      ),
    );
  }
}
