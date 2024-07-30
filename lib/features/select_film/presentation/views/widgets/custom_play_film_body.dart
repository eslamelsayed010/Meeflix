import 'package:flutter/material.dart';
import 'package:lomaTV/features/home/data/models/movie_details/movie_details.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/select_bloc_builder/similar_bloc_builder.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/select_film_section.dart';

class CustomPlayFilmBody extends StatelessWidget {
  const CustomPlayFilmBody({
    Key? key,
    required this.movieModel,
    required this.id,
    required this.movieDetails,
  }) : super(key: key);

  final MovieModel movieModel;
  final MovieDetails movieDetails;
  final num id;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SelectFilmSection(
            movieModel: movieModel,
            movieDetails: movieDetails,
          ),
        ),
        SimilarBlocBuilder(
          id: id,
        ),
      ],
    );
  }
}
