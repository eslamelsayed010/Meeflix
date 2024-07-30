import 'package:dartz/dartz.dart';
import 'package:lomaTV/core/errors/failures.dart';
import 'package:lomaTV/features/home/data/models/movie_details/movie_details.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/home/data/models/person_model.dart';

abstract class SelectRepo {
  Future<Either<Failures, MovieDetails>> fetchSelectFilm({required num id});
  Future<Either<Failures, List<MovieModel>>> fetchSimilarFilm({required num id});
  Future<Either<Failures, List<PersonModel>>> fetchCast({required num id});
}
