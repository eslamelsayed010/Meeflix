import 'package:lomaTV/features/home/data/models/movie_model.dart';

abstract class HomePlayState {}

class InitialHomePlayState extends HomePlayState {}

class LoadingHomePlayState extends HomePlayState {}

class SuccessHomePlayState extends HomePlayState {
  final MovieModel movies;
  SuccessHomePlayState(this.movies);
}

class FailureHomePlayState extends HomePlayState {
  final String error;
  FailureHomePlayState(this.error);
}
