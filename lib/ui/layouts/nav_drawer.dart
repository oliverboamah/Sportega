import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportega/env.dart';
import 'package:sportega/values/colors/colors.dart';

class NavDrawer extends StatefulWidget {
  final Function onMenuItemClicked;

  final List<String> menuTitles = [
    'News',
    'Video',
    'Photo',
    'Favorite',
    'About'
  ];
  final List<IconData> menuIcons = [
    CupertinoIcons.news_solid,
    CupertinoIcons.video_camera_solid,
    CupertinoIcons.photo_camera_solid,
    CupertinoIcons.heart_solid,
    Icons.info
  ];

  final menuItemColor = Color(PRIMARY_TEXT_COLOR);
  final selectedMenuItemColor = Color(PRIMARY_COLOR);

  // key to store and retrieve selectedMenuItem in shared prefs
  final selectedMenuItemKey = '@key:selectedMenuItem';

  NavDrawer({@required this.onMenuItemClicked});

  @override
  State<StatefulWidget> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  String selectedMenuItem = '';

  @override
  void initState() {
    super.initState();
    this._loadState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(PRIMARY_COLOR),
              ),
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(APP_LOGO),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 2),
                        child: Text(
                          APP_NAME,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Text(
                        APP_SLOGAN,
                        style: TextStyle(
                            fontSize: 13, color: Colors.white.withOpacity(0.8)),
                      )
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              title: Text(
                this.widget.menuTitles[0],
                style: TextStyle(
                    color: this.selectedMenuItem == this.widget.menuTitles[0]
                        ? this.widget.selectedMenuItemColor
                        : this.widget.menuItemColor),
              ),
              leading: IconButton(
                icon: Icon(
                  this.widget.menuIcons[0],
                  color: this.selectedMenuItem == this.widget.menuTitles[0]
                      ? this.widget.selectedMenuItemColor
                      : this.widget.menuItemColor,
                ),
                onPressed: () => {},
              ),
              onTap: () {
                this.setState(
                    () => this.selectedMenuItem = this.widget.menuTitles[0]);
                this._saveState(this.widget.menuTitles[0]);
                this.widget.onMenuItemClicked(this.widget.menuTitles[0]);

                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(this.widget.menuTitles[1],
                  style: TextStyle(
                      color: this.selectedMenuItem == this.widget.menuTitles[1]
                          ? this.widget.selectedMenuItemColor
                          : this.widget.menuItemColor)),
              leading: IconButton(
                icon: Icon(this.widget.menuIcons[1],
                    color: this.selectedMenuItem == this.widget.menuTitles[1]
                        ? this.widget.selectedMenuItemColor
                        : this.widget.menuItemColor),
                onPressed: () => {},
              ),
              onTap: () {
                this.setState(
                    () => this.selectedMenuItem = this.widget.menuTitles[1]);
                this._saveState(this.widget.menuTitles[1]);
                this.widget.onMenuItemClicked(this.widget.menuTitles[1]);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(this.widget.menuTitles[2],
                  style: TextStyle(
                      color: this.selectedMenuItem == this.widget.menuTitles[2]
                          ? this.widget.selectedMenuItemColor
                          : this.widget.menuItemColor)),
              leading: IconButton(
                icon: Icon(this.widget.menuIcons[2],
                    color: this.selectedMenuItem == this.widget.menuTitles[2]
                        ? this.widget.selectedMenuItemColor
                        : this.widget.menuItemColor),
                onPressed: () => {},
              ),
              onTap: () {
                this.setState(
                    () => this.selectedMenuItem = this.widget.menuTitles[2]);
                this._saveState(this.widget.menuTitles[2]);
                this.widget.onMenuItemClicked(this.widget.menuTitles[2]);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(this.widget.menuTitles[3],
                  style: TextStyle(
                      color: this.selectedMenuItem == this.widget.menuTitles[3]
                          ? this.widget.selectedMenuItemColor
                          : this.widget.menuItemColor)),
              leading: IconButton(
                icon: Icon(this.widget.menuIcons[3],
                    color: this.selectedMenuItem == this.widget.menuTitles[3]
                        ? this.widget.selectedMenuItemColor
                        : this.widget.menuItemColor),
                onPressed: () => {},
              ),
              onTap: () {
                this.setState(
                    () => this.selectedMenuItem = this.widget.menuTitles[3]);
                this._saveState(this.widget.menuTitles[3]);
                this.widget.onMenuItemClicked(this.widget.menuTitles[3]);
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              title: Text(this.widget.menuTitles[4],
                  style: TextStyle(
                      color: this.selectedMenuItem == this.widget.menuTitles[4]
                          ? this.widget.selectedMenuItemColor
                          : this.widget.menuItemColor)),
              leading: IconButton(
                icon: Icon(this.widget.menuIcons[4],
                    color: this.selectedMenuItem == this.widget.menuTitles[4]
                        ? this.widget.selectedMenuItemColor
                        : this.widget.menuItemColor),
                onPressed: () => {},
              ),
              onTap: () {
                this.setState(
                    () => this.selectedMenuItem = this.widget.menuTitles[4]);
                this._saveState(this.widget.menuTitles[4]);
                this.widget.onMenuItemClicked(this.widget.menuTitles[4]);
              },
            ),
          ],
        ),
      ),
    );
  }

  // save selectedMenuItem state
  void _saveState(String selectedMenuItem) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(this.widget.selectedMenuItemKey, selectedMenuItem);
    }).catchError((onError) {
      print(onError);
    });
  }

  // load selectedMenuItem state
  void _loadState() {
    SharedPreferences.getInstance().then((prefs) {
      final value = prefs.getString(this.widget.selectedMenuItemKey);
      if (value != null) {
        this.setState(() => this.selectedMenuItem = value);
      }
    }).catchError((onError) {
      print(onError);
    });
  }
}
