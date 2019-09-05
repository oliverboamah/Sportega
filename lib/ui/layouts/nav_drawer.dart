import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportega/values/colors/colors.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Color(PRIMARY_COLOR),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
