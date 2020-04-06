import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  final IconData icon;
  final String info;

  const MealDetails({Key key, @required this.icon, @required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(info),
      ],
    );
  }
}
