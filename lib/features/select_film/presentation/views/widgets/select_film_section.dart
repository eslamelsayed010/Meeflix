import 'package:flutter/cupertino.dart';
import 'package:lomaTV/features/home/data/models/movie_details/movie_details.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/adv_row_section.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/budget_row.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/desc_section.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/play_image_section.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/select_bloc_builder/cast_bloc_builder.dart';

class SelectFilmSection extends StatelessWidget {
  const SelectFilmSection(
      {Key? key, required this.movieModel, required this.movieDetails})
      : super(key: key);
  final MovieModel movieModel;
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlayImageSection(
          id: movieModel.id!,
          image: movieModel.backdropPath!,
          ratting: movieModel.voteAverage!,
          name: movieModel.title!,
        ),
        const SizedBox(height: 10),
        DescriptionSection(desc: movieModel.overview!),
        const SizedBox(height: 25),
        BudgetRow(
          duration: movieDetails.runtime!,
          budget: movieDetails.budget!,
          date: movieDetails.releaseDate!,
        ),
        const SizedBox(height: 10),
        const AdvancedRowSection(),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            'CAST',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const CastBlocBuilder(),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            'RELATED',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
