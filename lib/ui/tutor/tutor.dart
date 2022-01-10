import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/models/tutor_dto.dart';
import 'package:let_tutor/models/tutors.dart';
import 'package:let_tutor/widgets/card_info.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:provider/src/provider.dart';

class Tutor extends StatefulWidget {
  const Tutor({Key? key}) : super(key: key);

  @override
  _TutorState createState() => _TutorState();
}

class _TutorState extends State<Tutor> {
  List<TutorDTO>? listTutor;
  TextEditingController searchController = TextEditingController();
  
  favoriteCallback() {
    setState(() {
      listTutor!.sort((a, b) => sortListTutor(a, b));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    listTutor = context.read<List<TutorDTO>>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutors',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Become a tutor',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            CupertinoSearchTextField(
              controller: searchController,
              placeholder: 'Search tutors by name, nation, ...',
              padding: EdgeInsets.all(8),
              prefixIcon: const Icon(Icons.search),
            ),
            space(20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    listTutor!.length,
                    (index) => BriefInfoCard(
                        tutor: listTutor![index], callback: favoriteCallback),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
