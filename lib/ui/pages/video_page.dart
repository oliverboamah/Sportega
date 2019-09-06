import 'package:flutter/material.dart';
import 'package:sportega/ui/holders/video.dart';
import 'package:sportega/ui/layouts/video_app_bar.dart';
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
        body: YoutubePlayer(
          context: context,
          videoId: "iLnmTe5Q2Qw",
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
        ));
  }
}
