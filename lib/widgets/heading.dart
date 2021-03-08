import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String name;
  final String desc;
  HeadingWidget(this.name, this.desc);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
