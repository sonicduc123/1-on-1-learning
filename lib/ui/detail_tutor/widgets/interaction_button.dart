import 'package:flutter/material.dart';
import 'package:let_tutor/widgets/space.dart';

class InteractionButton extends StatelessWidget {
  const InteractionButton({Key? key, required this.name, required this.icon})
      : super(key: key);

  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
        ),
        space(20),
        Text(
          name,
          style: const TextStyle(
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
