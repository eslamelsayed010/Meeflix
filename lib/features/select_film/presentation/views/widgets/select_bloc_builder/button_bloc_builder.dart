import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/core/utils/app_router.dart';
import 'package:lomaTV/core/utils/style/color_manager.dart';
import 'package:lomaTV/core/widgets/custom_button.dart';
import 'package:lomaTV/core/widgets/show_toast.dart';
import 'package:lomaTV/features/video/presentation/manger/video_cubit/video_cubit.dart';
import 'package:lomaTV/features/video/presentation/manger/video_cubit/video_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ButtonBlocBuilder extends StatefulWidget {
  const ButtonBlocBuilder({super.key});

  @override
  State<ButtonBlocBuilder> createState() => _ButtonBlocBuilderState();
}

class _ButtonBlocBuilderState extends State<ButtonBlocBuilder> {
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
          height: 40,
          colorLoadingIndicator: ColorManager.red,
          isLoading: isLoading,
          text: state is FailureVideoState ? state.error : 'Play',
          addLogo: true,
          itemLogo: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          background: ColorManager.red,
          withBorder: false,
          radius: 50,
          marginHorizontal: 15,
          marginBottom: 10,
        );
      },
    );
  }
}
