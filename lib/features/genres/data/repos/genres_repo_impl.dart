import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lomaTV/core/errors/failures.dart';
import 'package:lomaTV/core/utils/api_services.dart';
import 'package:lomaTV/features/genres/data/models/genres_model.dart';
import 'package:lomaTV/features/genres/data/repos/genres_repo.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';

class GenresRepoImpl extends GenresRepo {
  final ApiServices apiServices;
  GenresRepoImpl(this.apiServices);

  @override
  Future<Either<Failures, GenreModel>> fetchGenres() async {
    try {
      var data = await apiServices.get(endPoint: 'genre/movie/list');

      return right(GenreModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<MovieModel>>> fetchGenresMovie(
      {required num id}) async {
    try {
      var data = await apiServices.getById(endPoint: 'discover/movie', id: id);
      List<MovieModel> movies = [];
      for (var movieMap in data['results']) {
        movies.add(MovieModel.fromJson(movieMap));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
