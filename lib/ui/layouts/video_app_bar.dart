import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportega/values/colors/colors.dart';

class VideoAppBar {
  final String title;

  VideoAppBar({@required this.title});

  AppBar getVideoAppBar(BuildContext context) {
    return AppBar(
      leading: new IconButton(
        icon: new Icon(CupertinoIcons.back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(this.title),
      centerTitle: true,
      backgroundColor: Color(PRIMARY_COLOR),
    );
  }
}
