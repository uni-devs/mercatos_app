import 'package:equatable/equatable.dart';

abstract class VideoPlayerState extends Equatable {
  @override
  List<Object> get props => const [];
}

class VideoPlayerStateInitial extends VideoPlayerState {
  @override
  List<Object> get props => const [];
}

class VideoPlayerStateLoading extends VideoPlayerState {}

class VideoPlayerStateError extends VideoPlayerState {
  final String message;

  VideoPlayerStateError(this.message);

  @override
  List<Object> get props => [message];
}

class VideoPlayerStateLoaded extends VideoPlayerState {
  VideoPlayerStateLoaded();

  @override
  List<Object> get props => [];
}
