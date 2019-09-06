import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportega/env.dart';
import 'package:sportega/values/colors/colors.dart';

AppBar getHomeAppBar() {
  return AppBar(
    title: Text(APP_NAME),
    centerTitle: true,
    backgroundColor: Color(PRIMARY_COLOR),
  );
}
