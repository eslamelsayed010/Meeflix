import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/features/home/data/models/movie_details/movie_details.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/select_film_view_body.dart';

class SelectFilmScaffold extends StatelessWidget {
  const SelectFilmScaffold(
      {super.key, required this.movieModel, required this.movieDetails});

  final MovieModel movieModel;
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SelectFilmViewBody(
              movieModel: movieModel,
              id: movieModel.id!,
              movieDetails: movieDetails,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
