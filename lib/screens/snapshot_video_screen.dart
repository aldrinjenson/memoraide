import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:memoria/widgets/starter_design.dart';

class SnapShotVideoScreen extends StatefulWidget {
  final String videoUrl;

  const SnapShotVideoScreen({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  _SnapShotVideoScreenState createState() => _SnapShotVideoScreenState();
}

class _SnapShotVideoScreenState extends State<SnapShotVideoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StartingDesign(
                "Snapshot Video", "Check out the Video generated", "home"),
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _controller.seekTo(Duration.zero);
                      _controller.play();
                    });
                  },
                  icon: Icon(Icons.replay),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  icon: Icon(_controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
