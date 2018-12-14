import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPage extends StatefulWidget {
  @override
  _VideoPlayPageState createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
//    'http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4',

    String url = "https://cdn.qupeiyin.cn/2016-09-08/1473324255209.mp4";
    _controller = VideoPlayerController.network(
        'https://cdn.qupeiyin.cn/2016-09-08/1473324255209.mp4')
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text('视频播放页'),
        ),
        body: Align(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _controller.value.isPlaying
              ? _controller.pause
              : _controller.play,
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}
