import 'package:lomaTV/features/home/data/models/movie_model.dart';

abstract class TopRattingState {}

class InitialTopRattingState extends TopRattingState {}

class LoadingTopRattingState extends TopRattingState {}

class SuccessTopRattingState extends TopRattingState {
  final List<MovieModel> movies;
  SuccessTopRattingState(this.movies);
}

class FailureTopRattingState extends TopRattingState {
  final String error;
  FailureTopRattingState(this.error);
}
