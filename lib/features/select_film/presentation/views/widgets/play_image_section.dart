import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lomaTV/core/utils/const.dart';
import 'package:lomaTV/features/home/presentation/views/widget/ratting_section.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/select_bloc_builder/button_bloc_builder.dart';
import 'package:lomaTV/features/video/presentation/manger/video_cubit/video_cubit.dart';

class PlayImageSection extends StatefulWidget {
  const PlayImageSection({
    super.key,
    required this.image,
    required this.ratting,
    required this.name,
    required this.id,
  });
  final String image;
  final num ratting;
  final String name;
  final num id;

  @override
  State<PlayImageSection> createState() => _PlayImageSectionState();
}

class _PlayImageSectionState extends State<PlayImageSection> {
  @override
  void initState() {
    VideoCubit.get(context).fetchVideo(id: widget.id);
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
        const ButtonBlocBuilder(),
        Positioned(
          bottom: 65,
          left: 10,
          child: RattingSection(editSize: true, ratting: widget.ratting),
        ),
        Positioned(
          bottom: 90,
          right: 10,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              widget.name,
              textAlign: TextAlign.end,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
