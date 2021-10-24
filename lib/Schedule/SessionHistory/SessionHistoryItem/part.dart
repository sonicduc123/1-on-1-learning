import 'package:flutter/cupertino.dart';
import 'package:let_tutor/Ultility/space.dart';

class Part extends StatelessWidget {
  const Part({Key? key, required this.icon, required this.name})
      : super(key: key);

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
        ),
        space(5),
        Text(name),
      ],
    );
  }
}
