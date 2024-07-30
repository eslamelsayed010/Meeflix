// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lomaTV/core/widgets/custom_error_widget.dart';
// import 'package:lomaTV/core/widgets/custom_loading_indicator.dart';
// import 'package:lomaTV/features/home/presentation/views/widget/play_button.dart';
// import 'package:lomaTV/features/video/presentation/manger/video_cubit/video_cubit.dart';
// import 'package:lomaTV/features/video/presentation/manger/video_cubit/video_state.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// class PlayButtonBlocBuilder extends StatefulWidget {
//   const PlayButtonBlocBuilder({super.key, required this.id});
//   final num id;
//
//   @override
//   State<PlayButtonBlocBuilder> createState() => _PlayButtonBlocBuilderState();
// }
//
// class _PlayButtonBlocBuilderState extends State<PlayButtonBlocBuilder> {
//   @override
//   void initState() {
//     VideoCubit.get(context).fetchVideo(id: widget.id);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<VideoCubit, VideoState>(
//       builder: (context, state) {
//         if (state is SuccessVideoState) {
//           return PlayButton(
//               youtubePlayerController: YoutubePlayerController(
//             initialVideoId: state.videoModel.key!,
//             flags: const YoutubePlayerFlags(
//               autoPlay: true,
//             ),
//           ));
//         } else if (state is FailureVideoState) {
//           return CustomErrorWidget(errorMassage: state.error);
//         } else {
//           return const CustomLoadingIndicator();
//         }
//       },
//     );
//   }
// }
