import 'package:flutter/material.dart';

class InforField extends StatelessWidget {
  const InforField({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ),
      ),
    );
  }
}
