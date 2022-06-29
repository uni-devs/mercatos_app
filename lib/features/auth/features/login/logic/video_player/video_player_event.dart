import 'package:equatable/equatable.dart';

import '../../data/models/video.dart';

abstract class VideoPlayerEvent extends Equatable {
  @override
  List<Object> get props => const [];
}

class VideoPlayerSelected extends VideoPlayerEvent {
  final Video video;

  VideoPlayerSelected(this.video);

  @override
  List<Object> get props => [video];
}
