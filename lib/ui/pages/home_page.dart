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
  int _selectedTabIndex = 0;

  // tabs
  List<Widget> _tabs = [];

  // page storage bucket
  final pageStorageBucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    this._initializeTabs();
  }

  void _initializeTabs() {
    this._tabs = [
      NewsTab(
        key: PageStorageKey('NewsTab'),
        onGoToFavoriteButtonClicked: () =>
            this.setState(() => this._selectedTabIndex = 3),
      ),
      VideoTab(
        key: PageStorageKey('VideoTab'),
      ),
      PhotoTab(
        key: PageStorageKey('PhotoTab'),
      ),
      FavouriteTab()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getHomeAppBar(),
        drawer: NavDrawer(
          onMenuItemClicked: (title) => this._onDrawerMenuItemClicked(title),
        ),
        bottomNavigationBar: BottomNav(
          currentIndex: _selectedTabIndex,
          onItemSelected: (index) =>
              this.setState(() => this._selectedTabIndex = index),
        ),
        backgroundColor: Colors.white,
        body: PageStorage(
            child: this._tabs[this._selectedTabIndex],
            bucket: this.pageStorageBucket));
  }

  void _onDrawerMenuItemClicked(String title) {
    print('Title : ' + title);
    switch (title) {
      case 'News':
        this.setState(() => this._selectedTabIndex = 0);
        break;
      case 'Video':
        this.setState(() => this._selectedTabIndex = 1);
        break;
      case 'Photo':
        this.setState(() => this._selectedTabIndex = 2);
        break;
      case 'Favorite':
        this.setState(() => this._selectedTabIndex = 3);
        break;
      case 'About':
        // display about us dialog box
        break;
      default:
        this.setState(() => this._selectedTabIndex = 0);
    }
  }
}
