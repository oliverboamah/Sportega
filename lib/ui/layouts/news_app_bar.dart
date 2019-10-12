import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportega/values/colors/colors.dart';

class NewsAppBar {
  final BuildContext context;
  final Function onSendIconClicked;

  NewsAppBar({@required this.context, this.onSendIconClicked});

  AppBar getNewsAppBar() {
    return AppBar(
      leading: new IconButton(
        icon: new Icon(CupertinoIcons.back, color: Colors.white),
        onPressed: () => Navigator.of(this.context).pop(),
      ),
      title: Text(
        'Back',
      ),
      backgroundColor: Color(PRIMARY_COLOR),
      actions: <Widget>[
        IconButton(
          icon: Icon(CupertinoIcons.share_up),
          onPressed: () => this.onSendIconClicked(),
        )
      ],
    );
  }
}
