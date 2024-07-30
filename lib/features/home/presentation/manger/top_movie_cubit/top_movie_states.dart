import 'package:lomaTV/features/home/data/models/movie_model.dart';

abstract class TopMovieState {}

class InitialTopMovieState extends TopMovieState {}

class LoadingTopMovieState extends TopMovieState {}

class SuccessTopMovieState extends TopMovieState {
  final List<MovieModel> movies;

  SuccessTopMovieState(this.movies);
}

class FailureTopMovieState extends TopMovieState {
  final String error;
  FailureTopMovieState(this.error);
}
