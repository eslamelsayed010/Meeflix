import 'package:lomaTV/features/genres/data/models/genres_model.dart';

abstract class GenresState {}

class InitialGenresState extends GenresState {}

class LoadingGenresState extends GenresState {}

class SuccessGenresState extends GenresState {
  final GenreModel genreModel;
  SuccessGenresState(this.genreModel);
}

class FailureGenresState extends GenresState {
  final String error;
  FailureGenresState(this.error);
}
