import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lomaTV/core/utils/const.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';

class CarouselSliderMovies extends StatelessWidget {
  const CarouselSliderMovies({Key? key, required this.movies})
      : super(key: key);
  final List<MovieModel> movies;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: movies.map((e) {
        return CachedNetworkImage(
          fit: BoxFit.cover,
          width: double.infinity,
          imageUrl: '$baseImageApiUrl${e.backdropPath!}',
          errorWidget: (context, url, error) {
            // print(error);
            return const Center(
              child: Icon(Icons.error),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * .4,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1.0,
      ),
    );
  }
}
