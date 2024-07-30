import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/widgets/custom_error_widget.dart';
import 'package:lomaTV/features/home/presentation/manger/top_movie_cubit/top_movie_cubit.dart';
import 'package:lomaTV/features/home/presentation/manger/top_movie_cubit/top_movie_states.dart';
import 'package:lomaTV/features/home/presentation/views/widget/list_view_top_movie.dart';
import 'package:lomaTV/features/home/presentation/views/widget/loading_indicator/list_view_home_view_indicator.dart';

class TopMovieBlocBuilder extends StatelessWidget {
  const TopMovieBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopMovieCubit, TopMovieState>(
      builder: (context, state) {
        if (state is SuccessTopMovieState) {
          return ListViewTopMovies(movies: state.movies);
        } else if (state is FailureTopMovieState) {
          return CustomErrorWidget(errorMassage: state.error);
        } else {
          return const ListViewHomeLoadingIndicator();
        }
      },
    );
  }
}
