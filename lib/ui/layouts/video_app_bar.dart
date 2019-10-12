import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoAppBar {
  BuildContext context;
  final String title;

  VideoAppBar({@required this.context, @required this.title});

  AppBar getVideoAppBar() {
    return AppBar(
      leading: new IconButton(
        icon: new Icon(CupertinoIcons.back, color: Colors.white),
        onPressed: () => Navigator.of(this.context).pop(),
      ),
      title: Text(this.title),
      centerTitle: true,
    );
  }
}
