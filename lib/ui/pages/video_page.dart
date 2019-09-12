import 'package:flutter/material.dart';
import 'package:sportega/ui/holders/video.dart';
import 'package:sportega/ui/layouts/video_app_bar.dart';
import 'package:sportega/values/colors/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  final Video video;

  VideoPage({@required this.video});

  @override
  State<StatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            VideoAppBar(title: this.widget.video.title).getVideoAppBar(context),
        body: Column(
          children: <Widget>[
            YoutubePlayer(
              context: context,
              videoId: this.widget.video.videoId,
              flags: YoutubePlayerFlags(
                autoPlay: true,
                showVideoProgressIndicator: true,
              ),
              videoProgressIndicatorColor: Colors.amber,
              progressColors: ProgressColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
              onPlayerInitialized: (controller) {},
            ),
            videoDetailsView()
          ],
        ));
  }

  // video details widget
  Widget videoDetailsView() {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          this.widget.video.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Divider(),
      Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(top: 4.0, left: 16, bottom: 8),
        child: Text(
          this.widget.video.time,
          style: TextStyle(color: Color(SECONDARY_TEXT_COLOR), fontSize: 13),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Text(
          this.widget.video.description,
        ),
      )
    ]);
  }
}
