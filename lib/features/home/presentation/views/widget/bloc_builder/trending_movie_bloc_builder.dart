import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/widgets/custom_error_widget.dart';
import 'package:lomaTV/features/home/presentation/manger/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:lomaTV/features/home/presentation/manger/trending_movie_cubit/trending_movie_states.dart';
import 'package:lomaTV/features/home/presentation/views/widget/list_view_trending_show.dart';
import 'package:lomaTV/features/home/presentation/views/widget/loading_indicator/list_view_home_view_indicator.dart';

class TrendingMovieBlocBuilder extends StatelessWidget {
  const TrendingMovieBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
      builder: (context, state) {
        if (state is SuccessTrendingMovieState) {
          return ListViewTrendingShows(movies: state.movies);
        } else if (state is FailureTrendingMovieState) {
          return CustomErrorWidget(errorMassage: state.error);
        } else {
          return const ListViewHomeLoadingIndicator();
        }
      },
    );
  }
}
