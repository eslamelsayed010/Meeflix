import 'package:dartz/dartz.dart';
import 'package:lomaTV/core/errors/failures.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/home/data/models/person_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<MovieModel>>> fetchTopMovies();
  Future<Either<Failures, List<MovieModel>>> fetchTopRatting();
  Future<Either<Failures, List<MovieModel>>> fetchTrendingMovie();
  Future<Either<Failures, List<PersonModel>>> fetchTrendingPerson();
  Future<Either<Failures, MovieModel>> fetchHomePlay({required int id});
  Future<Either<Failures, List<MovieModel>>> fetchCarouselSlider();
}
