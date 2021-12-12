import 'package:flutter/material.dart';

class ListChip extends StatefulWidget {
  const ListChip({Key? key, required this.listChip}) : super(key: key);

  final List<String> listChip;

  @override
  _ListChipState createState() => _ListChipState();
}

class _ListChipState extends State<ListChip> {
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 5,
        children: List.generate(
          widget.listChip.length,
          (index) => ChoiceChip(
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
            },
            label: Text(widget.listChip[index]),
            labelStyle: const TextStyle(color: Colors.blue),
            backgroundColor: Colors.blue[50],
            shape: StadiumBorder(side: BorderSide(color: Colors.blue.shade100)),
          ),
        ),
      ),
    );
  }
}

Widget createListChip(List<String> listChip) => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 5,
        children: List.generate(
          listChip.length,
          (index) => Chip(
            label: Text(listChip[index]),
            labelStyle: const TextStyle(color: Colors.blue),
            backgroundColor: Colors.blue[50],
            shape: StadiumBorder(side: BorderSide(color: Colors.blue.shade100)),
          ),
        ),
      ),
    );
