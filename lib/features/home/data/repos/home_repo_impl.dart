import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lomaTV/core/errors/failures.dart';
import 'package:lomaTV/core/utils/api_services.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/home/data/models/person_model.dart';
import 'package:lomaTV/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failures, List<MovieModel>>> fetchTopMovies() async {
    try {
      var data = await apiServices.get(endPoint: 'movie/popular');
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
  Future<Either<Failures, List<MovieModel>>> fetchTopRatting() async {
    try {
      var data = await apiServices.get(endPoint: 'movie/top_rated');
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
  Future<Either<Failures, List<MovieModel>>> fetchTrendingMovie() async {
    try {
      var data = await apiServices.get(endPoint: 'movie/now_playing');
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
  Future<Either<Failures, List<PersonModel>>> fetchTrendingPerson() async {
    try {
      var data = await apiServices.get(endPoint: 'person/popular');
      List<PersonModel> persons = [];
      for (var personMap in data['results']) {
        persons.add(PersonModel.fromJson(personMap));
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

  @override
  Future<Either<Failures, MovieModel>> fetchHomePlay({required int id}) async {
    try {
      var data = await apiServices.get(endPoint: 'movie/$id)');
      return right(MovieModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<MovieModel>>> fetchCarouselSlider() async {
    try {
      var data =
          await apiServices.getById(endPoint: 'discover/movie', id: 35);
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
