import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/core/utils/app_router.dart';
import 'package:lomaTV/core/utils/const.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/home/presentation/views/widget/custom_image.dart';
import 'package:lomaTV/features/home/presentation/views/widget/ratting_section.dart';

class CustomFilmsDetails extends StatelessWidget {
  const CustomFilmsDetails({Key? key, required this.movieModel}) : super(key: key);
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSelectFilm, extra: movieModel);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImage(image: '$baseImageApiUrl${movieModel.posterPath}'),
          SizedBox(
            width: 100,
            child: Text(
              movieModel.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ),
          RattingSection(
            ratting: movieModel.voteAverage!,
          ),
        ],
      ),
    );
  }
}
