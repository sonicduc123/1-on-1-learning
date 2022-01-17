import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoInfor extends StatefulWidget {
  const VideoInfor({Key? key, required this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  _VideoInforState createState() => _VideoInforState();
}

class _VideoInforState extends State<VideoInfor> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool isPlaying = false;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      widget.videoUrl,
    );

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.addListener(() {
      if (!_controller.value.isPlaying &&
          _controller.value.position > Duration.zero &&
          _controller.value.position == _controller.value.duration) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return Stack(
            alignment: Alignment.bottomLeft,
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.blue,
                ),
                margin: const EdgeInsets.all(5),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                      isPlaying = !isPlaying;
                    });
                  },
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }
}
