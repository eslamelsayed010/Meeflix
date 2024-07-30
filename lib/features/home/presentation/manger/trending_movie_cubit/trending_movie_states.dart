import 'package:lomaTV/features/home/data/models/movie_model.dart';

abstract class TrendingMovieState {}

class InitialTrendingMovieState extends TrendingMovieState {}

class LoadingTrendingMovieState extends TrendingMovieState {}

class SuccessTrendingMovieState extends TrendingMovieState {
  final List<MovieModel> movies;
  SuccessTrendingMovieState(this.movies);
}

class FailureTrendingMovieState extends TrendingMovieState {
  final String error;
  FailureTrendingMovieState(this.error);
}
