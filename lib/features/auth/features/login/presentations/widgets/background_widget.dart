import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/video.dart';
import '../../data/services/video_controller_service.dart';
import '../../logic/video_player/video_player_bloc.dart';
import '../../logic/video_player/video_player_event.dart';
import '../../logic/video_player/video_player_state.dart';
import 'video_player_widget.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<VideoPlayerBloc>(
          create: (context) => VideoPlayerBloc(
              videoControllerService:
                  RepositoryProvider.of<VideoControllerService>(context))
            ..add(VideoPlayerSelected(Video(
              title: 'Fluttering Butterfly',
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
            ))),
          child: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
            builder: (context, state) {
              return _getPlayer(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _getPlayer(BuildContext context, VideoPlayerState state) {
    if (state is VideoPlayerStateLoaded) {
      return const VideoPlayer();
    }

    if (state is VideoPlayerStateError) {
      return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey,
        child: Center(
          child: Text(state.message),
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.grey,
      child: const Center(
        child: Text('Initialising video...'),
      ),
    );
  }
}
