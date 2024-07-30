import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/core/utils/app_router.dart';
import 'package:lomaTV/core/utils/style/color_manager.dart';
import 'package:lomaTV/core/widgets/custom_button.dart';
import 'package:lomaTV/core/widgets/show_toast.dart';
import 'package:lomaTV/features/video/presentation/manger/video_cubit/video_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../video/presentation/manger/video_cubit/video_state.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({super.key});

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        return CustomButon(
          onPressed: () {
            if (state is LoadingVideoState) {
              isLoading = true;
            } else if (state is SuccessVideoState) {
              if (state.videos[0].key == null) {
                showToast(
                  txt: 'The film does not contain trailer',
                  state: ToastState.ERROR,
                );
              } else {
                GoRouter.of(context).push(
                  AppRouter.kVideoView,
                  extra: YoutubePlayerController(
                    initialVideoId: state.videos[0].key!,
                    flags: const YoutubePlayerFlags(
                      autoPlay: true,
                    ),
                  ),
                );
              }
            }
            if (state is FailureVideoState) {
              showToast(
                txt: state.error.toString(),
                state: ToastState.ERROR,
              );
            }
          },
          colorLoadingIndicator: ColorManager.red,
          isLoading: isLoading,
          text: state is FailureVideoState ? state.error : 'Play',
          background: ColorManager.red,
          width: 100,
          height: 40,
          withBorder: false,
          addLogo: true,
          itemLogo: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
