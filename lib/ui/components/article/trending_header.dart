import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sportega/values/colors/colors.dart';
import 'package:sportega/values/dimen/dimen.dart';

class TrendingHeader extends StatelessWidget {
  final String title;

  TrendingHeader({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.star,
            size: SECONDARY_ICON_SIZE,
            color: Color(SECONDARY_TEXT_COLOR),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              this.title,
              style:
                  TextStyle(fontSize: 20, color: Color(SECONDARY_TEXT_COLOR)),
            ),
          ),
          Expanded(
          
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.more_horiz,
                  size: 24, color: Color(SECONDARY_TEXT_COLOR)),
            ),
          )
        ],
      ),
    );
  }
}
