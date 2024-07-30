import 'package:flutter/material.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/home/presentation/views/widget/custom_films_details.dart';

class ListViewTrendingShows extends StatelessWidget {
  const ListViewTrendingShows({Key? key, required this.movies})
      : super(key: key);
  final List<MovieModel> movies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165 + 50 + 20,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            CustomFilmsDetails(movieModel: movies[index]),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: movies.length,
      ),
    );
  }
}
