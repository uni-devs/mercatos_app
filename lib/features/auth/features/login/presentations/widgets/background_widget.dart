import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercatos/components/themes/mercatos_colors.dart';
import 'package:mercatos/features/auth/features/login/data/repositories/video_player_repository.dart';

import '../../../../../../components/widgets/loading_widget.dart';
import '../../logic/video_player/video_player_bloc.dart';
import 'video_player_widget.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MercatosColors.background_video_color,
      body: SafeArea(
        child: BlocProvider<VideoPlayerBloc>(
          create: (context) => VideoPlayerBloc(
              videoPlayerRepo: RepositoryProvider.of<VideoPlayerRepo>(context))
            ..add(VideosFetched()),
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
    if (state.scrollingStatus == ScrollingStatus.loaded ||
        state.videoPlayerStatus == VideoPlayerStatus.loaded) {
      return const VideoPlayerWidget();
    } else if (state.scrollingStatus == ScrollingStatus.error ||
        state.videoPlayerStatus == VideoPlayerStatus.error) {
      return Container(
        height: ScreenUtil.defaultSize.height,
        color: MercatosColors.icon_button_color,
        child: Center(
          child: Text(state.errorMessage ?? "Error"),
        ),
      );
    } else {
      return const Center(child: LoadingDialog());
    }
  }
}
