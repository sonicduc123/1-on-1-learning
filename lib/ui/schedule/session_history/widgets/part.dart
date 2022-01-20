import 'package:flutter/cupertino.dart';
import 'package:let_tutor/widgets/space.dart';

class Part extends StatelessWidget {
  const Part({Key? key, required this.icon, required this.name})
      : super(key: key);

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 20,
        ),
        space(5),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
