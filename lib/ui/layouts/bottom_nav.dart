import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportega/values/colors/colors.dart';

class BottomNav extends StatefulWidget {

  // call back function when an item is selected
  final Function onItemSelected;

  BottomNav ( {this.onItemSelected});

  final List<String> titles = ['News', 'Video', 'Photo', 'Favourite'];
  final List<IconData> icons = [
    CupertinoIcons.news_solid,
    CupertinoIcons.video_camera_solid,
    CupertinoIcons.photo_camera_solid,
    CupertinoIcons.heart_solid
  ];

  @override
  State<StatefulWidget> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  TextStyle commonTextStyle() {
    return TextStyle(color: Color(PRIMARY_TEXT_COLOR));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color(PRIMARY_COLOR),
        onTap: (index) => widget.onItemSelected(index),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text(widget.titles[0], style: commonTextStyle(),),
            icon: Icon(widget.icons[0], color: Color(PRIMARY_TEXT_COLOR))
          ),
          BottomNavigationBarItem(
            title: Text(widget.titles[1], style: commonTextStyle()),
            icon: Icon(widget.icons[1], color: Color(PRIMARY_TEXT_COLOR)),
          ),
          BottomNavigationBarItem(
            title: Text(widget.titles[2], style: commonTextStyle()),
            icon: Icon(widget.icons[2], color: Color(PRIMARY_TEXT_COLOR)),
          ),
          BottomNavigationBarItem(
            title: Text(widget.titles[3], style: commonTextStyle()),
            icon: Icon(widget.icons[3], color: Color(PRIMARY_TEXT_COLOR)),
          ),
          
        ]);
  }
}
