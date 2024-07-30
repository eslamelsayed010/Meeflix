import 'package:dartz/dartz.dart';
import 'package:lomaTV/core/errors/failures.dart';
import 'package:lomaTV/features/genres/data/models/genres_model.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';

abstract class GenresRepo {
  Future<Either<Failures, GenreModel>> fetchGenres();
  Future<Either<Failures, List<MovieModel>>> fetchGenresMovie({required num id});
}
