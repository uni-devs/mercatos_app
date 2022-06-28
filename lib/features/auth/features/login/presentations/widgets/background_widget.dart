import 'package:flutter/material.dart';
import '../../../../../../components/widgets/VideoPlayerScrollable/video_player_scrollable.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideoScrolling extends StatefulWidget {
  const BackgroundVideoScrolling({Key? key}) : super(key: key);

  @override
  State<BackgroundVideoScrolling> createState() =>
      _BackgroundVideoScrollingState();
}

class _BackgroundVideoScrollingState extends State<BackgroundVideoScrolling> {
  late Controller controller;
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;
  final videos = [
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4'
  ];
  final colors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
  ];
  @override
  initState() {
    super.initState();
    controller = Controller()
      ..addListener((event) {
        _handleCallbackEvent(event.direction, event.success,
            currentIndex: controller.getScrollPosition());
      });

    _videoController = VideoPlayerController.network(videos[0])
      ..initialize().then((_) {
        setState(() {});
      });

    _videoController.play();
    _videoController.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoFullPageScroller(
        contentSize: videos.length,
        swipePositionThreshold: 0,
        swipeVelocityThreshold: MediaQuery.of(context).size.height * 0.2,
        animationDuration: const Duration(milliseconds: 200),
        controller: controller,
        builder: (BuildContext context, int index) {
          return Container(
            color: Colors.red,
            child: Stack(children: [
              Center(
                child: _videoController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _videoController.value.aspectRatio,
                        child: VideoPlayer(_videoController),
                      )
                    : const Center(child: CircularProgressIndicator()),
              )

              // _videoController.value.isInitialized
              //     ? FutureBuilder(
              //         future: _initializeVideoPlayerFuture,
              //         builder: (context, snapshot) {
              //           if (snapshot.connectionState == ConnectionState.done) {
              //             return AspectRatio(
              //               aspectRatio: _videoController.value.aspectRatio,
              //               child: VideoPlayer(_videoController),
              //             );
              //           } else {
              //             return const Center(
              //                 child: CircularProgressIndicator());
              //           }
              //         },
              //       )
              //     : const Center(child: CircularProgressIndicator()),
            ]),
          );
        },
      ),
    );
  }

  void _handleCallbackEvent(ScrollDirection direction, ScrollSuccess success,
      {required int currentIndex}) {
    _videoController = VideoPlayerController.network(videos[0])
      ..initialize().then((_) {
        setState(() {});
      });
    _videoController.play();

    debugPrint(
        "Scroll callback received with data: {direction: $direction, success: $success and index: $currentIndex}");
  }
}
