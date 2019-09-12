import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:sportega/services/api/video_repo.dart';
import 'package:sportega/ui/components/offline.dart';
import 'package:sportega/ui/components/progress.dart';
import 'package:sportega/ui/components/server_error.dart';
import 'package:sportega/ui/components/video/video_list.dart';
import 'package:sportega/ui/constants/load_data_status.dart';
import 'package:sportega/ui/holders/video.dart';
import 'package:sportega/ui/routes/routes.dart';

class VideoTab extends StatefulWidget {
  final Function onGoToFavoriteButtonClicked;

  VideoTab({this.onGoToFavoriteButtonClicked});

  @override
  State<StatefulWidget> createState() => _VideoTabState();
}

class _VideoTabState extends State<VideoTab> {
  // load data status
  LoadDataStatus _loadDataStatus;

  // state
  List<Video> videoList = [];

  @override
  void initState() {
    super.initState();
    this._loadData();
  }

  void _loadData() {
    // show progress indicator
    this.setState(() => this._loadDataStatus = LoadDataStatus.loading);

    VideoRepo().getVideos().then((videos) {
      this.setState(() {
        this.videoList = videos;
        this._loadDataStatus = LoadDataStatus.success;
      });
    }).catchError((error) {
      this.setState(() {
        this._loadDataStatus = error is SocketException
            ? LoadDataStatus.offline
            : LoadDataStatus.serverError;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return this._content(context);
  }

  Widget _content(BuildContext context) {
    switch (this._loadDataStatus) {
      case LoadDataStatus.success:
        return this._getVideosWidget(context);
      case LoadDataStatus.offline:
        return this._getOfflineWidget();
      case LoadDataStatus.serverError:
        return this._getServerErrorWidget();
      default:
        return Progress();
    }
  }

  // videos grid list widget
  Widget _getVideosWidget(BuildContext context) {
    return VideoList(
      videoList: this.videoList,
      onItemSelected: (position) =>
          Routes().navigateToVideoPage(context, this.videoList[position]),
    );
  }

  // offline widget
  Widget _getOfflineWidget() {
    return Offline(
      image: 'assets/images/offline.png',
      title: 'You are Offline',
      subTitle: 'Read news items you saved in your favorites folder',
      buttonTitle: 'Go to Favorites',
      onButtonClicked: () => this.widget.onGoToFavoriteButtonClicked(),
      onRetryClicked: () => this._loadData(),
    );
  }

  // offline widget
  Widget _getServerErrorWidget() {
    return ServerError(
      image: 'assets/images/server_error.png',
      title: 'Oops! It\'s not you, it\'s us',
      subTitle: 'A server error was encountered when loading the data',
      onRetryClicked: () => this._loadData(),
    );
  }
}
