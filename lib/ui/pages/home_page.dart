import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportega/ui/layouts/home_app_bar.dart';
import 'package:sportega/ui/layouts/bottom_nav.dart';
import 'package:sportega/ui/layouts/nav_drawer.dart';
import 'package:sportega/ui/tabs/favourite_tab.dart';
import 'package:sportega/ui/tabs/news_tab.dart';
import 'package:sportega/ui/tabs/photo_tab.dart';
import 'package:sportega/ui/tabs/video_tab.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State {
  // seletected tab index
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getHomeAppBar(),
        drawer: NavDrawer(
          onMenuItemClicked: (title) => this._onDrawerMenuItemClicked(title),
        ),
        bottomNavigationBar: BottomNav(
            onItemSelected: (index) =>
                this.setState(() => this.selectedTabIndex = index)),
        backgroundColor: Colors.white,
        body: this._showTab());
  }

  Widget _showTab() {
    switch (this.selectedTabIndex) {
      case 0:
        return NewsTab(
          onGoToFavoriteButtonClicked: () =>
              this.setState(() => this.selectedTabIndex = 3),
        );
      case 1:
        return VideoTab();
      case 2:
        return PhotoTab();
      case 3:
        return FavouriteTab();
      default:
        return NewsTab(
          onGoToFavoriteButtonClicked: () =>
              this.setState(() => this.selectedTabIndex = 3),
        );
    }
  }

  void _onDrawerMenuItemClicked(String title) {
    print('Title : ' + title);
    switch (title) {
      case 'News':
        this.setState(() => this.selectedTabIndex = 0);
        break;
      case 'Video':
        this.setState(() => this.selectedTabIndex = 1);
        break;
      case 'Photo':
        this.setState(() => this.selectedTabIndex = 2);
        break;
      case 'Favorite':
        this.setState(() => this.selectedTabIndex = 3);
        break;
      case 'About':
        // display about us dialog box
        break;
      default:
        this.setState(() => this.selectedTabIndex = 0);
    }
  }
}
