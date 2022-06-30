part of 'video_player_bloc.dart';

abstract class VideoPlayerEvent extends Equatable {
  @override
  List<Object> get props => const [];
}

// * video player events
class VideoPlayerChanged extends VideoPlayerEvent {
  final int videoID;
  final ScrollDirection scrollDirection;

  VideoPlayerChanged(this.videoID, this.scrollDirection);

  @override
  List<Object> get props => [videoID, scrollDirection];
}

class VideoPlayerToggled extends VideoPlayerEvent {
  @override
  List<Object> get props => [];
}

// * scrolling events
class VideosFetched extends VideoPlayerEvent {
  @override
  List<Object> get props => [];
}

class VideosAddFetched extends VideoPlayerEvent {
  @override
  List<Object> get props => [];
}
