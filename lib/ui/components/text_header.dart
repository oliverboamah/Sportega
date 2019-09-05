import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportega/values/colors/colors.dart';

class TextHeader extends StatelessWidget {
  final String title;
  final String subTitle;

  TextHeader({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 10),
          child: Text(
            this.title,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(PRIMARY_TEXT_COLOR)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 5, bottom: 8),
          child: Text(this.subTitle,
              style: TextStyle(fontSize: 13, color: Color(SECONDARY_TEXT_COLOR))),
        ),
        Divider(
         
        )
      ],
    );
  }
}
