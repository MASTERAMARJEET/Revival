import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final List<String> list;
  SectionWidget(this.title, this.list);
  @override
  Widget build(BuildContext context) {
    if (list.length == 0) {
      return Container();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 8.0,
          ),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              children: list.map((e) => TextSpan(text: e + '\n\n')).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
