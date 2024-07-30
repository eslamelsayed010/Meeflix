import 'package:lomaTV/features/home/data/models/movie_model.dart';

abstract class SimilarState {}

class InitialSimilarState extends SimilarState {}

class LoadingSimilarState extends SimilarState {}

class SuccessSimilarState extends SimilarState {
  final List<MovieModel> movies;
  SuccessSimilarState(this.movies);
}

class FailureSimilarState extends SimilarState {
  final String error;
  FailureSimilarState(this.error);
}
