import 'package:lomaTV/features/home/data/models/movie_details/movie_details.dart';

abstract class SelectState {}

class InitialSelectState extends SelectState {}

class LoadingSelectState extends SelectState {}

class SuccessSelectState extends SelectState {
  final MovieDetails movieDetails;
  SuccessSelectState(this.movieDetails);
}

class FailureSelectState extends SelectState {
  final String error;
  FailureSelectState(this.error);
}
