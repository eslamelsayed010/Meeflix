import 'package:lomaTV/features/home/data/models/movie_model.dart';

abstract class GenresMovieState {}

class InitialGenresMovieState extends GenresMovieState {}

class LoadingGenresMovieState extends GenresMovieState {}

class SuccessGenresMovieState extends GenresMovieState {
  final List<MovieModel> movies;
  SuccessGenresMovieState(this.movies);
}

class FailureGenresMovieState extends GenresMovieState {
  final String error;
  FailureGenresMovieState(this.error);
}
