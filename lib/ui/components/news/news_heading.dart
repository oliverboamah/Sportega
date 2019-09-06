import 'package:flutter/material.dart';
import 'package:sportega/values/colors/colors.dart';

class NewsHeading extends StatelessWidget {
  final String title;
  final String datetime;

  NewsHeading({this.title, this.datetime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 250,
          child: Text(
            this.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(PRIMARY_TEXT_COLOR),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        Container(
          height: 3,
          width: 150,
          margin: EdgeInsets.only(top: 10),
          color: Colors.black12,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            this.datetime,
          ),
        )
      ],
    );
  }
}
