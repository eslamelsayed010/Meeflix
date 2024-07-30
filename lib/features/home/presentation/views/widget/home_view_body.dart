import 'package:flutter/material.dart';
import 'package:lomaTV/features/genres/presentation/views/widgets/genres_bloc_builder.dart';
import 'package:lomaTV/features/home/presentation/views/widget/bloc_builder/carousel_slider_bloc_builder.dart';
import 'package:lomaTV/features/home/presentation/views/widget/bloc_builder/top_movie_bloc_builder.dart';
import 'package:lomaTV/features/home/presentation/views/widget/bloc_builder/top_ratting_bloc_builder.dart';
import 'package:lomaTV/features/home/presentation/views/widget/bloc_builder/trending_movie_bloc_builder.dart';
import 'package:lomaTV/features/home/presentation/views/widget/home_app_bar.dart';
import 'package:lomaTV/features/home/presentation/views/widget/title_movie_section.dart';
import 'bloc_builder/trending_person_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              CustomHomeAppBar(),
              // HomePlayBlocBuilder(),
              CarouselSliderBlocBuilder(),
              SizedBox(height: 15),
              GenresBlocBuilder(),
              SizedBox(height: 15),
              TitleMovieSection(title: 'Trending Persons In The Week'),
              SizedBox(height: 10),
              TrendingPersonBlocBuilder(),
              SizedBox(height: 10),
              TitleMovieSection(title: 'Movies Shows Trending Today'),
              SizedBox(height: 10),
              TrendingMovieBlocBuilder(),
              TitleMovieSection(title: 'Top Movies Ratting'),
              SizedBox(height: 10),
              TopRattingBlocBuilder(),
              TitleMovieSection(title: 'Top Movies Last Week'),
              SizedBox(height: 10),
              TopMovieBlocBuilder(),
            ],
          ),
        )
      ],
    );
  }
}
