import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/video_player/video_player_bloc.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<VideoPlayerBloc>().chewieController;

    return controller == null
        ? Container()
        : Chewie(
            controller: controller,
          );
  }
}
