// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'video_player_bloc.dart';

/*
* VideoPlayerState
  initial
  loading
  loaded
  error
  pause
  played

* scrolling
  initial
  loading
  loaded
  error
*/
enum VideoPlayerStatus {
  initial,
  loading,
  loaded,
  error,
  pause,
  played,
}

enum ScrollingStatus {
  initial,
  loading,
  loaded,
  error,
}

class VideoPlayerState extends Equatable {
  final VideoPlayerStatus videoPlayerStatus;
  final ScrollingStatus scrollingStatus;
  final String? errorMessage;
  final List<Video> _listVideos;
  final int selectedVideo;
  final int videoLength;
  final bool playerPaused;

  List<Video> get listVideos => [..._listVideos];

  const VideoPlayerState._(
    this.videoPlayerStatus,
    this.scrollingStatus,
    this.errorMessage,
    this._listVideos,
    this.selectedVideo,
    this.videoLength,
    this.playerPaused,
  );

  static const initial = VideoPlayerState._(
    VideoPlayerStatus.initial,
    ScrollingStatus.initial,
    null,
    [],
    0,
    0,
    false,
  );
  // ------------------------------------------------------------
  // *                      video status
  // ------------------------------------------------------------
  VideoPlayerState loadingVideo() => _copyWith(
        videoPlayerStatus: VideoPlayerStatus.loading,
      );

  VideoPlayerState loadedVideo() => _copyWith(
        videoPlayerStatus: VideoPlayerStatus.loaded,
      );

  VideoPlayerState pauseVideo() => _copyWith(
        videoPlayerStatus: VideoPlayerStatus.pause,
        playerPaused: true,
      );

  VideoPlayerState playedVideo() => _copyWith(
        videoPlayerStatus: VideoPlayerStatus.played,
        playerPaused: false,
      );
  VideoPlayerState errorVideo({required String error}) => _copyWith(
        videoPlayerStatus: VideoPlayerStatus.error,
        errorMessage: error,
      );
  // ------------------------------------------------------------

  // ------------------------------------------------------------
  // *                      Scrolling status
  // ------------------------------------------------------------
  VideoPlayerState loadingScroll() => _copyWith(
        scrollingStatus: ScrollingStatus.loading,
      );

  VideoPlayerState loadedScroll() => _copyWith(
        scrollingStatus: ScrollingStatus.loaded,
      );

  VideoPlayerState errorScrolling({required String error}) => _copyWith(
        scrollingStatus: ScrollingStatus.error,
        errorMessage: error,
      );
  // ------------------------------------------------------------

  // ------------------------------------------------------------
  // *                      Other Methods
  // ------------------------------------------------------------
  VideoPlayerState changeCurrentVideo({required int videoID}) => _copyWith(
        selectedVideo: videoID,
      );

  VideoPlayerState addVideos({required List<Video> videos}) => _copyWith(
        listVideos: [..._listVideos, ...videos],
        videoLength: _listVideos.length + videos.length,
      );

  VideoPlayerState removeAllVideos() => _copyWith(
        listVideos: [],
        videoLength: 0,
      );

  VideoPlayerState fetchVideos() => _copyWith(
        videoPlayerStatus: VideoPlayerStatus.loading,
        scrollingStatus: ScrollingStatus.loading,
      );

  VideoPlayerState fetchMoreCachedVideos() => _copyWith(
        scrollingStatus: ScrollingStatus.loading,
      );
  // ------------------------------------------------------------

  VideoPlayerState _copyWith({
    VideoPlayerStatus? videoPlayerStatus,
    ScrollingStatus? scrollingStatus,
    String? errorMessage,
    List<Video>? listVideos,
    int? selectedVideo,
    int? videoLength,
    bool? playerPaused,
  }) {
    return VideoPlayerState._(
      videoPlayerStatus ?? this.videoPlayerStatus,
      scrollingStatus ?? this.scrollingStatus,
      errorMessage ?? this.errorMessage,
      listVideos ?? _listVideos,
      selectedVideo ?? this.selectedVideo,
      videoLength ?? this.videoLength,
      playerPaused ?? this.playerPaused,
    );
  }

  @override
  List<Object?> get props => [
        _listVideos,
        scrollingStatus,
        videoPlayerStatus,
        errorMessage,
        selectedVideo,
        videoLength,
        playerPaused
      ];
}
