
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(
      'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    );

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
     // customControls: CustomChewieControls(),
      autoPlay: true,
      looping: true,
      showControls: false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video Player
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          // Custom Progress Bar and Controls
          CustomVideoControls(videoController: _videoPlayerController,chewieController:_chewieController),
          // Video Title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Sample Video Title',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Video Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'This is a sample description for the video. It provides a brief overview of what the video is about.',
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}

class CustomVideoControls extends StatelessWidget {
  final VideoPlayerController videoController;
  final ChewieController chewieController;

  const CustomVideoControls({Key? key, required this.videoController, required this.chewieController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: VideoProgressIndicator(
            videoController,
            allowScrubbing: true,
            colors: const VideoProgressColors(
              playedColor: Colors.red,
              backgroundColor: Colors.grey,
              bufferedColor: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder(
                valueListenable: videoController,
                builder: (context, VideoPlayerValue value, child) {
                  return Text(
                    _formatDuration(value.position),
                    style: const TextStyle(color: Colors.white),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: videoController,
                builder: (context, VideoPlayerValue value, child) {
                  return Text(
                    _formatDuration(value.duration),
                    style: const TextStyle(color: Colors.white),
                  );
                },
              ),
            ],
          ),
        ),
        // Controls Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.replay_10, color: Colors.black),
                onPressed: () {
                  final currentPosition = videoController.value.position;
                  videoController.seekTo(
                    Duration(seconds: currentPosition.inSeconds - 10),
                  );
                },
              ),
              IconButton(
                icon: ValueListenableBuilder(
                  valueListenable: videoController,
                  builder: (context, VideoPlayerValue value, child) {
                    return Icon(
                      value.isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.black,
                    );
                  },
                ),
                onPressed: () {
                  if (videoController.value.isPlaying) {
                    videoController.pause();
                  } else {
                    videoController.play();
                  }
                },
              ),
              IconButton(
                icon: ValueListenableBuilder(
                  valueListenable: videoController,
                  builder: (context, VideoPlayerValue value, child) {
                    return Icon(
                      value.volume > 0 ? Icons.volume_up : Icons.volume_off,
                      color: Colors.black,
                    );
                  },
                ),
                onPressed: () {
                  final newVolume =
                  videoController.value.volume > 0 ? 0.0 : 1.0;
                  videoController.setVolume(newVolume);
                },
              ),
              IconButton(
                icon: const Icon(Icons.fullscreen, color: Colors.black),
                onPressed: () {
                  chewieController.enterFullScreen();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '${duration.inHours}:${minutes}:${seconds}';
  }
}

//  chewie: ^1.7.5
//  video_player: ^2.8.5

//https://chatgpt.com/share/67520557-8284-8002-b70e-56d74e081db0
