import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoView extends StatelessWidget {
  const VideoView({Key? key, required this.youtubePlayerController})
      : super(key: key);
  final YoutubePlayerController youtubePlayerController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: YoutubePlayer(
            controller: youtubePlayerController,
            onEnded: (YoutubeMetaData metaData) {
              GoRouter.of(context).pop();
            },
          )),
          Positioned(
            top: 40,
            right: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
