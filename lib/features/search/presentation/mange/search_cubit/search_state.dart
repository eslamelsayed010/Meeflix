import 'package:lomaTV/features/home/data/models/movie_model.dart';

abstract class SearchState {}

class InitialSearchState extends SearchState {}

class LoadingSearchState extends SearchState {}

class SuccessSearchState extends SearchState {
  final List<MovieModel> movies;

  SuccessSearchState(this.movies);
}

class FailureSearchState extends SearchState {
  final String error;

  FailureSearchState(this.error);
}
