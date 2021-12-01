import 'package:flutter/material.dart';

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
