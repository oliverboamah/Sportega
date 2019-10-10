import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportega/values/colors/colors.dart';

class BottomNav extends StatefulWidget {
  // call back function when an item is selected
  final Function onItemSelected;

  BottomNav({this.onItemSelected});

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
  // selected tab index
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: this._selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color(PRIMARY_COLOR),
        unselectedItemColor: Color(PRIMARY_TEXT_COLOR),
        onTap: (index) {
          widget.onItemSelected(index);
          this.setState(() => this._selectedIndex = index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text(
                widget.titles[0],
              ),
              icon: Icon(
                widget.icons[0],
              )),
          BottomNavigationBarItem(
            title: Text(widget.titles[1]),
            icon: Icon(
              widget.icons[1],
            ),
          ),
          BottomNavigationBarItem(
            title: Text(widget.titles[2]),
            icon: Icon(widget.icons[2]),
          ),
          BottomNavigationBarItem(
            title: Text(widget.titles[3]),
            icon: Icon(widget.icons[3]),
          ),
        ]);
  }
}
