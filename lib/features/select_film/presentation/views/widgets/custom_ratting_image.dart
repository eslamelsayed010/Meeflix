import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/core/utils/app_router.dart';
import 'package:lomaTV/core/utils/const.dart';
import 'package:lomaTV/core/utils/style/color_manager.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/home/presentation/views/widget/custom_image.dart';

class CustomRattingImage extends StatelessWidget {
  const CustomRattingImage({Key? key, required this.movieModel})
      : super(key: key);
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSelectFilm, extra: movieModel);
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          CustomImage(
            image: '$baseImageApiUrl${movieModel.posterPath}' ??
                '', // ignore: dead_null_aware_expression
          ),
          CircleAvatar(
            radius: 10,
            backgroundColor: ColorManager.red,
            child: Text(
              movieModel.voteAverage!.toStringAsFixed(1) ??
                  '0.0', // ignore: dead_null_aware_expression
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
