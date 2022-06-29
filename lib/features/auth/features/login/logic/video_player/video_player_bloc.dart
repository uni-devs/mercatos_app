import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import '../../data/services/video_controller_service.dart';
import 'video_player.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  final VideoControllerService videoControllerService;
  ChewieController? chewieController;
  VideoPlayerBloc({
    this.chewieController,
    required this.videoControllerService,
  }) : super(VideoPlayerStateInitial()) {
    on<VideoPlayerSelected>(_onVideoPlayerSelected);
  }
  _onVideoPlayerSelected(
      VideoPlayerSelected event, Emitter<VideoPlayerState> emit) async {
    emit(VideoPlayerStateLoading());
    try {
      final videoController =
          await videoControllerService.getControllerForVideo(event.video);
      chewieController = ChewieController(
        videoPlayerController: videoController,
        showControlsOnInitialize: false,
        showOptions: false,
        looping: true,
        aspectRatio: 1 / 1,
        autoInitialize: true,
        autoPlay: true,
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      );
      emit(VideoPlayerStateLoaded());
    } catch (e) {
      emit(VideoPlayerStateError(e.toString()));
    }
  }
}
