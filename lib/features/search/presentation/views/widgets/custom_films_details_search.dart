import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/core/utils/app_router.dart';
import 'package:lomaTV/core/utils/const.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/home/presentation/views/widget/custom_image.dart';
import 'package:lomaTV/features/home/presentation/views/widget/ratting_section.dart';

class CustomFilmsDetailsSearch extends StatelessWidget {
  const CustomFilmsDetailsSearch({Key? key, required this.movieModel})
      : super(key: key);
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kSelectFilm, extra: movieModel);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: CustomImage(
                  image: '$baseImageApiUrl${movieModel.posterPath}'),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      movieModel.title!,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    movieModel.releaseDate!,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.grey[300]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  RattingSection(
                    ratting: movieModel.voteAverage!,
                    editSize: true,
                    size: 13,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
