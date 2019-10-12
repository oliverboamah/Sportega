import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportega/env.dart';

AppBar getHomeAppBar() {
  return AppBar(
    title: Text(APP_NAME),
    centerTitle: true
  );
}
