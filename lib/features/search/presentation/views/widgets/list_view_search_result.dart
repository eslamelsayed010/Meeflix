import 'package:flutter/material.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/search/presentation/views/widgets/custom_films_details_search.dart';

class ListViewSearch extends StatelessWidget {
  const ListViewSearch({Key? key, required this.movies}) : super(key: key);

  final List<MovieModel> movies;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              'Search Result',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  CustomFilmsDetailsSearch(movieModel: movies[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemCount: movies.length,
            ),
          ),
        ],
      ),
    );
  }
}
