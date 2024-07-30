import 'package:flutter/material.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/custom_ratting_image.dart';
import '../../../../home/data/models/movie_model.dart';

class RelatedGridView extends StatelessWidget {
  const RelatedGridView({Key? key, required this.movies}) : super(key: key);
  final List<MovieModel> movies;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.6 / 4,
        crossAxisSpacing: 0,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomRattingImage(movieModel: movies[index]),
      ),
      itemCount: movies.length,
    );
  }
}

// GridView.builder(
// padding: EdgeInsets.zero,
// physics: const NeverScrollableScrollPhysics(),
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 3,
// childAspectRatio: 2.6 / 4,
// crossAxisSpacing: 10,
// mainAxisSpacing: 20,
// ),
// itemBuilder: (context, index) => const CustomRattingImage(),
// itemCount: 15,
// )
