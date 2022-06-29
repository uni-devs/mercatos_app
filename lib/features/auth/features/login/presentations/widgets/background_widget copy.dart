import 'package:flutter/material.dart';
import 'package:mercatos/components/widgets/loading_widget.dart';
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
  int _currentIndex = 0;
  final videos = [
    'https://v16-webapp.tiktok.com/57a2504b00a0602272672f5c9b4a0ec3/62bb5942/video/tos/useast2a/tos-useast2a-ve-0068c004/8aaede531073472f8f3d5e28bff89fc3/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=3396&bt=1698&btag=80000&cs=0&ds=3&ft=eXd.6HQ2Myq8Z6DH8we2NTH6yl7Gb&mime_type=video_mp4&qs=0&rc=ZTg3Zzc5OTk0PDNoZTtmOUBpajR4czo6ZjRqZDMzNzczM0BhXmMzMTAzNjAxYC81YC0zYSNncS0zcjRnMTVgLS1kMTZzcw%3D%3D&l=202206281339280102230760421E0B9B26',
    'https://v16-webapp.tiktok.com/816a9ddc5a3a885273b12f91033b2ce0/62bb5916/video/tos/useast2a/tos-useast2a-ve-0068c004/9408700a1a76433bbef340c08cb777fe/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=3958&bt=1979&btag=80000&cs=0&ds=3&ft=eXd.6HQ2Myq8Z6DH8we2NTH6yl7Gb&mime_type=video_mp4&qs=0&rc=PGk8ZDloaWkzNTg0PDloZkBpamtyazY6ZmU7ZDMzNzczM0A1LjYtYjRjXjMxYV42MjVeYSNyczUucjRfXjFgLS1kMTZzcw%3D%3D&l=202206281339280102230760421E0B9B26',
    'https://v16-webapp.tiktok.com/54c7fb78318bc162d1469e67ff6c3747/62bb590d/video/tos/useast2a/tos-useast2a-pve-0068/155b0d9c1620471398aa803542649fb5/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=2150&bt=1075&btag=80000&cs=0&ds=3&ft=eXd.6HQ2Myq8Z6DH8we2NTH6yl7Gb&mime_type=video_mp4&qs=0&rc=ZDY8ZWQzO2VpZzVoZDMzN0BpMzptZWc6ZmhnZDMzNzczM0BfY14yMTA1Xi4xMV4vMzZjYSNyaC9ycjRfNGxgLS1kMTZzcw%3D%3D&l=202206281339280102230760421E0B9B26',
    'https://v16-webapp.tiktok.com/c79d78931bc217b4b52cbf6bd5a6c1d3/62bb5908/video/tos/useast2a/tos-useast2a-pve-0068/0e7af7ad775d435887e6f191011e7eba/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=5416&bt=2708&btag=80000&cs=0&ds=3&ft=eXd.6HQ2Myq8Z6DH8we2NTH6yl7Gb&mime_type=video_mp4&qs=0&rc=O2Q1ZGU2ZWc8ODY5OTRmaEBpamRudDw6ZmpvZDMzNzczM0BgYV8yMmMzNS8xYmE1Y2EwYSMvNS9zcjRvbGlgLS1kMTZzcw%3D%3D&l=202206281339280102230760421E0B9B26'
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
    _videoController = VideoPlayerController.network(videos[_currentIndex])
      ..initialize().then((_) {
        setState(() {
          _videoController.play();
          _videoController.setLooping(true);
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: VideoFullPageScroller(
        contentSize: videos.length,
        swipePositionThreshold: 0,
        swipeVelocityThreshold: MediaQuery.of(context).size.height * 0.2,
        animationDuration: const Duration(milliseconds: 200),
        controller: controller,
        builder: (BuildContext context, int index) {
          return Container(
            color: Colors.black,
            child: Stack(children: [
              Center(
                child: _videoController.value.isInitialized
                    ? InkWell(
                        onTap: (() {
                          if (_videoController.value.isPlaying) {
                            _videoController.pause();
                          } else {
                            _videoController.play();
                          }
                        }),
                        child: AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        ),
                      )
                    : const Center(child: LoadingDialog()),
              )
            ]),
          );
        },
      ),
    );
  }

  void _handleCallbackEvent(ScrollDirection direction, ScrollSuccess success,
      {required int currentIndex}) {
    if (currentIndex != _currentIndex) {
      _videoController.pause();
      _videoController = VideoPlayerController.network(videos[currentIndex])
        ..initialize().then((_) {
          setState(() {
            _currentIndex = currentIndex;
            _videoController.play();
            _videoController.setLooping(true);
          });
        });
    }

    debugPrint(
        "Scroll callback received with data: {direction: $direction, success: $success and index: $currentIndex}");
  }
}
