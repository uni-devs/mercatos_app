//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercatos/components/themes/mercatos_constants.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
//
import '../../../../../../components/themes/mercatos_colors.dart';
import '../../../../../../components/themes/mercatos_text_styles.dart';
import '../../../../../../components/widgets/VideoPlayerScrollable/video_player_scrollable.dart';
import '../../../../../../components/widgets/loading_widget.dart';
import '../../logic/video_player/video_player_bloc.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<VideoPlayerBloc>();
    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
      builder: (context, state) {
        final controller = context.read<VideoPlayerBloc>().videoController;

        return VideoFullPageScroll(
          contentSize: bloc.state.videoLength,
          swipePositionThreshold: 0,
          swipeVelocityThreshold: ScreenUtil.defaultSize.height * 0.2,
          animationDuration: const Duration(milliseconds: 200),
          controller: bloc.scrollController,
          builder: (BuildContext context, int index) {
            return InkWell(
              onTap: (() {
                bloc.add(VideoPlayerToggled());
              }),
              child: Container(
                color: MercatosColors.background_video_color,
                child: Stack(children: [
                  Center(
                    child: controller != null
                        ? AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: VideoPlayer(controller),
                          )
                        : const Center(child: LoadingDialog()),
                  ),
                  Positioned(
                    bottom: 160.h,
                    right: 15.w,
                    child: Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 18.h,
                      children: [
                        VideoAction(
                          onPressed: () {},
                          actionType: VideoActionType.love,
                          data: state.listVideos[state.selectedVideo].likes
                              .toString(),
                        ),
                        VideoAction(
                          onPressed: () {},
                          actionType: VideoActionType.comment,
                          data: state.listVideos[state.selectedVideo].comments
                              .toString(),
                        ),
                        VideoAction(
                          onPressed: () async {
                            String uri = MercatosConstants.appUrl();
                            if (!await launchUrl(
                              Uri.parse(uri),
                              mode: LaunchMode.externalApplication,
                            )) {
                              throw 'Could not launch $uri';
                            }
                          },
                          actionType: VideoActionType.share,
                          data: "",
                        ),
                      ],
                    ),
                  ),
                  const PlayPauseIcon(),
                ]),
              ),
            );
          },
        );
      },
    );
  }
}

enum VideoActionType {
  love,
  comment,
  share,
}

// ignore: must_be_immutable
class VideoAction extends StatelessWidget {
  final VideoActionType actionType;
  final String data;
  late String assetName;
  final void Function()? onPressed;
  VideoAction({
    Key? key,
    required this.actionType,
    required this.data,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (actionType) {
      case VideoActionType.love:
        assetName = 'assets/icons/love.svg';
        break;
      case VideoActionType.comment:
        assetName = 'assets/icons/comments.svg';
        break;
      case VideoActionType.share:
        assetName = 'assets/icons/share.svg';
        break;
    }
    return InkWell(
      onTap: onPressed,
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 2.h,
        children: [
          SvgPicture.asset(
            assetName,
            height: 30.h,
            width: 30.h,
            color: MercatosColors.text_filed_filled_color,
          ),
          Text(
            data,
            style: MercatosTextStyle.number_text,
          )
        ],
      ),
    );
  }
}

class PlayPauseIcon extends StatefulWidget {
  const PlayPauseIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayPauseIcon> createState() => _PlayPauseIconState();
}

class _PlayPauseIconState extends State<PlayPauseIcon>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<VideoPlayerBloc>();
    bloc.animateIconController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: double.parse(bloc.state.playerPaused ? "1.0" : "0.0"),
          duration: const Duration(milliseconds: 500),
          child: Align(
            alignment: Alignment.center,
            child: AnimatedIcon(
              color: MercatosColors.primary_color,
              size: 55.h,
              icon: AnimatedIcons.pause_play,
              progress: bloc.animateIconController!,
            ),
          ),
        );
      },
    );
  }
}
