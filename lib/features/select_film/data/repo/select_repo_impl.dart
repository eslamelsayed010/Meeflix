import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lomaTV/core/errors/failures.dart';
import 'package:lomaTV/core/utils/api_services.dart';
import 'package:lomaTV/features/home/data/models/movie_details/movie_details.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/home/data/models/person_model.dart';
import 'package:lomaTV/features/select_film/data/repo/select_repo.dart';

class SelectRepoImpl extends SelectRepo {
  final ApiServices apiServices;

  SelectRepoImpl(this.apiServices);
  @override
  Future<Either<Failures, MovieDetails>> fetchSelectFilm(
      {required num id}) async {
    try {
      var data = await apiServices.get(endPoint: 'movie/$id');
      return right(MovieDetails.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<MovieModel>>> fetchSimilarFilm(
      {required num id}) async {
    try {
      var data = await apiServices.get(endPoint: 'movie/$id/similar');
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

  @override
  Future<Either<Failures, List<PersonModel>>> fetchCast(
      {required num id}) async {
    try {
      var data = await apiServices.get(endPoint: 'movie/$id/credits');
      List<PersonModel> persons = [];
      for (var imageMap in data['cast']) {
        persons.add(PersonModel.fromJson(imageMap));
      }
      return right(persons);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
