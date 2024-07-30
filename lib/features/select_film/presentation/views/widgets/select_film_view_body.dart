import 'package:flutter/material.dart';
import 'package:lomaTV/features/home/data/models/movie_details/movie_details.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/custom_play_film_body.dart';

class SelectFilmViewBody extends StatelessWidget {
  const SelectFilmViewBody({
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
    return CustomPlayFilmBody(
      movieModel: movieModel,
      id: id,
      movieDetails: movieDetails,
    );
  }
}
