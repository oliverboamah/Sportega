import 'package:flutter/material.dart';
import 'package:sportega/env.dart';

void showAboutAppDialog(BuildContext context) {
  showAboutDialog(
    context: context,
    applicationIcon: CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage(APP_LOGO),
    ),
    applicationName: APP_NAME,
    applicationVersion: APP_VERSION,
    children: <Widget>[Text(APP_DESCRIPTION)],
  );
}
