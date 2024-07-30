import 'package:lomaTV/features/home/data/models/movie_model.dart';

abstract class CarouselSliderState {}

class InitialCarouselSliderState extends CarouselSliderState {}

class LoadingCarouselSliderState extends CarouselSliderState {}

class SuccessCarouselSliderState extends CarouselSliderState {
  final List<MovieModel> movies;
  SuccessCarouselSliderState(this.movies);
}

class FailureCarouselSliderState extends CarouselSliderState {
  final String error;
  FailureCarouselSliderState(this.error);
}
