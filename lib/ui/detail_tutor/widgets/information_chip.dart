import 'package:flutter/material.dart';
import 'package:let_tutor/widgets/list_chip.dart';
import 'package:let_tutor/widgets/space.dart';

import 'information_field.dart';

class InforChip extends StatelessWidget {
  const InforChip({Key? key, required this.title, required this.listChip})
      : super(key: key);

  final String title;
  final List<String> listChip;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InforField(title: title),
        createListChip(listChip),
        space(10),
      ],
    );
  }
}
