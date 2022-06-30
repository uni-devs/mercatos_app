import 'dart:async';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';
import '../models/video.dart';

// import '../../../../data/models/interfaces/interfaces.dart';
// import '../services/services.dart';

class VideoPlayerRepo {
  late final BaseCacheManager _cacheManager;
  VideoPlayerRepo(this._cacheManager);
  List<Video> fetchVideos() {
    List<Video> videos = getDummyVideos();
    return videos;
  }

  List<Video> fetchMoreVideos({required int offset}) {
    List<Video> videos = getDummyVideos();
    return videos;
  }

  Future<VideoPlayerController> getControllerForVideo(Video video) async {
    final fileInfo = await _cacheManager.getFileFromCache(video.url);

    if (fileInfo == null) {
      unawaited(_cacheManager.downloadFile(video.url));

      return VideoPlayerController.network(video.url);
    } else {
      return VideoPlayerController.file(fileInfo.file);
    }
  }
}

List<Video> getDummyVideos() {
  return [
    const Video(
      id: 1,
      title: "title",
      url:
          // 'https://v16-webapp.tiktok.com/816a9ddc5a3a885273b12f91033b2ce0/62bb5916/video/tos/useast2a/tos-useast2a-ve-0068c004/9408700a1a76433bbef340c08cb777fe/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=3958&bt=1979&btag=80000&cs=0&ds=3&ft=eXd.6HQ2Myq8Z6DH8we2NTH6yl7Gb&mime_type=video_mp4&qs=0&rc=PGk8ZDloaWkzNTg0PDloZkBpamtyazY6ZmU7ZDMzNzczM0A1LjYtYjRjXjMxYV42MjVeYSNyczUucjRfXjFgLS1kMTZzcw%3D%3D&l=202206281339280102230760421E0B9B26',
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      comments: 11,
      likes: 33,
      shareUrl: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    ),
    const Video(
      id: 0,
      title: "title",
      url:
          // 'https://v16-webapp.tiktok.com/57a2504b00a0602272672f5c9b4a0ec3/62bb5942/video/tos/useast2a/tos-useast2a-ve-0068c004/8aaede531073472f8f3d5e28bff89fc3/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=3396&bt=1698&btag=80000&cs=0&ds=3&ft=eXd.6HQ2Myq8Z6DH8we2NTH6yl7Gb&mime_type=video_mp4&qs=0&rc=ZTg3Zzc5OTk0PDNoZTtmOUBpajR4czo6ZjRqZDMzNzczM0BhXmMzMTAzNjAxYC81YC0zYSNncS0zcjRnMTVgLS1kMTZzcw%3D%3D&l=202206281339280102230760421E0B9B26',
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      comments: 222,
      likes: 332,
      shareUrl: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    ),
    const Video(
      id: 2,
      title: "title",
      url:
          // 'https://v16-webapp.tiktok.com/54c7fb78318bc162d1469e67ff6c3747/62bb590d/video/tos/useast2a/tos-useast2a-pve-0068/155b0d9c1620471398aa803542649fb5/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=2150&bt=1075&btag=80000&cs=0&ds=3&ft=eXd.6HQ2Myq8Z6DH8we2NTH6yl7Gb&mime_type=video_mp4&qs=0&rc=ZDY8ZWQzO2VpZzVoZDMzN0BpMzptZWc6ZmhnZDMzNzczM0BfY14yMTA1Xi4xMV4vMzZjYSNyaC9ycjRfNGxgLS1kMTZzcw%3D%3D&l=202206281339280102230760421E0B9B26',
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      comments: 22,
      likes: 3334,
      shareUrl: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    ),
    const Video(
      id: 3,
      title: "title",
      url:
          // 'https://v16-webapp.tiktok.com/c79d78931bc217b4b52cbf6bd5a6c1d3/62bb5908/video/tos/useast2a/tos-useast2a-pve-0068/0e7af7ad775d435887e6f191011e7eba/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=5416&bt=2708&btag=80000&cs=0&ds=3&ft=eXd.6HQ2Myq8Z6DH8we2NTH6yl7Gb&mime_type=video_mp4&qs=0&rc=O2Q1ZGU2ZWc8ODY5OTRmaEBpamRudDw6ZmpvZDMzNzczM0BgYV8yMmMzNS8xYmE1Y2EwYSMvNS9zcjRvbGlgLS1kMTZzcw%3D%3D&l=202206281339280102230760421E0B9B26',
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      comments: 226,
      likes: 335,
      shareUrl: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    ),
  ];
}
