import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/core/utils/app_router.dart';
import 'package:lomaTV/core/utils/const.dart';
import 'package:lomaTV/core/utils/style/color_manager.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/home/presentation/views/widget/play_button.dart';
import 'package:lomaTV/features/video/presentation/manger/video_cubit/video_cubit.dart';

class HomePlay extends StatefulWidget {
  const HomePlay({Key? key, required this.movies, required this.image})
      : super(key: key);
  final MovieModel movies;
  final String image;

  @override
  State<HomePlay> createState() => _HomePlayState();
}

class _HomePlayState extends State<HomePlay> {
  bool isMyList = false;

  @override
  void initState() {
    VideoCubit.get(context).fetchVideo(id: widget.movies.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .4,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: '$baseImageApiUrl${widget.image}',
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
            bottom: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context)
                          .push(AppRouter.kSelectFilm, extra: widget.movies);
                    },
                    icon: const Icon(Icons.info_outline),
                  ),
                  const Text(
                    'Info',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const PlayButton(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {});
                      isMyList = !isMyList;
                      //add toast massage
                    },
                    icon: isMyList
                        ? const Icon(
                            Icons.check,
                            color: Colors.red,
                          )
                        : const Icon(Icons.add),
                  ),
                  if (isMyList)
                    Text(
                      'My List',
                      style: TextStyle(
                        color: ColorManager.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  else
                    const Text(
                      'My List',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
