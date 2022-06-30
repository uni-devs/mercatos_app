import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:mercatos/features/auth/features/login/data/models/video.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../components/widgets/VideoPlayerScrollable/video_player_scrollable.dart';
import '../../data/repositories/video_player_repository.dart';
import 'package:equatable/equatable.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  final VideoPlayerRepo videoPlayerRepo;
  Controller? scrollController;
  VideoPlayerController? videoController;
  AnimationController? animateIconController;

  VideoPlayerBloc({
    required this.videoPlayerRepo,
  }) : super(VideoPlayerState.initial) {
    scrollController = Controller()
      ..addListener((event) {
        if (state.videoLength - state.selectedVideo < 3 &&
            videoController != null) {
          add(
            VideosAddFetched(),
          );
        }
        add(VideoPlayerChanged(
            scrollController?.getScrollPosition() ?? 0, event.direction));
      });
    on<VideosFetched>(_onVideosFetched);
    on<VideosAddFetched>(_onVideosAddFetched);
    on<VideoPlayerToggled>(_onVideoPlayerToggled);
    on<VideoPlayerChanged>(_onVideoPlayerChanged);
  }

  _onVideosFetched(VideosFetched event, Emitter<VideoPlayerState> emit) async {
    emit(state.removeAllVideos());
    emit(state.fetchVideos());
    List<Video> videos = videoPlayerRepo.fetchVideos();
    emit(state.addVideos(videos: videos));
    try {
      videoController?.pause();
      for (var video in videos) {
        videoPlayerRepo.getControllerForVideo(video);
      }
      videoController = await videoPlayerRepo.getControllerForVideo(videos[0]);
      await videoController?.initialize();
      await videoController?.play();
      await videoController?.setLooping(true);
      emit(state.loadedVideo());
      emit(state.loadedScroll());
    } catch (e) {
      emit(state.errorVideo(error: e.toString()));
    }
  }

  _onVideosAddFetched(
      VideosAddFetched event, Emitter<VideoPlayerState> emit) async {
    emit(state.fetchMoreCachedVideos());
    List<Video> videos =
        videoPlayerRepo.fetchMoreVideos(offset: state.selectedVideo);
    emit(state.addVideos(videos: videos));
    try {
      for (var video in videos) {
        videoPlayerRepo.getControllerForVideo(video);
      }
      emit(state.loadedScroll());
    } catch (e) {
      emit(state.errorScrolling(error: e.toString()));
    }
  }

  _onVideoPlayerToggled(
      VideoPlayerToggled event, Emitter<VideoPlayerState> emit) async {
    if (state.playerPaused) {
      emit(state.playedVideo());
      videoController?.play();
      animateIconController?.reverse();
    } else {
      emit(state.pauseVideo());
      videoController?.pause();
      animateIconController?.forward();
    }
  }

  _onVideoPlayerChanged(
      VideoPlayerChanged event, Emitter<VideoPlayerState> emit) async {
    if (event.scrollDirection == ScrollDirection.BACKWARDS &&
        state.selectedVideo == 0) {
      add(VideosFetched());
    } else {
      if (state.selectedVideo != event.videoID) {
        await videoController?.pause();
        emit(state.loadingVideo());
        Video video = state.listVideos[event.videoID];
        videoController = await videoPlayerRepo.getControllerForVideo(video);
        await videoController?.initialize();
        await videoController?.play();
        await videoController?.setLooping(true);
        emit(state.changeCurrentVideo(videoID: event.videoID));
        emit(state.loadedVideo());
      }
    }
  }
}
