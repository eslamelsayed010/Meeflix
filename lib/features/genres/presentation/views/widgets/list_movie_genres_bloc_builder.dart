import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/widgets/custom_error_widget.dart';
import 'package:lomaTV/core/widgets/custom_loading_indicator.dart';
import 'package:lomaTV/features/genres/presentation/manger/genres_movie_cubit/genres_movie_cubit.dart';
import 'package:lomaTV/features/genres/presentation/manger/genres_movie_cubit/genres_movie_states.dart';
import 'package:lomaTV/features/genres/presentation/views/widgets/list_view_genres_movie.dart';

class ListMovieGenresBlocBuilder extends StatefulWidget {
  const ListMovieGenresBlocBuilder({Key? key, required this.id})
      : super(key: key);

  final int id;

  @override
  State<ListMovieGenresBlocBuilder> createState() =>
      _ListMovieGenresBlocBuilderState();
}

class _ListMovieGenresBlocBuilderState
    extends State<ListMovieGenresBlocBuilder> {
  @override
  void initState() {
    GenresMovieCubit.get(context).fetchGenresMovieId(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresMovieCubit, GenresMovieState>(
        builder: (context, state) {
      if (state is SuccessGenresMovieState) {
        return ListViewGenresMovie(movies: state.movies);
      } else if (state is FailureGenresMovieState) {
        return CustomErrorWidget(errorMassage: state.error);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
