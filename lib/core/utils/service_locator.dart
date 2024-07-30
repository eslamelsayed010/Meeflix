import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lomaTV/core/utils/api_services.dart';
import 'package:lomaTV/features/genres/data/repos/genres_repo_impl.dart';
import 'package:lomaTV/features/home/data/repos/home_repo_impl.dart';
import 'package:lomaTV/features/search/data/repos/search_repo_impl.dart';
import 'package:lomaTV/features/select_film/data/repo/select_repo_impl.dart';
import 'package:lomaTV/features/video/data/repos/video_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));

  getIt.registerSingleton<SelectRepoImpl>(
      SelectRepoImpl(getIt.get<ApiServices>()));

  getIt.registerSingleton<GenresRepoImpl>(
      GenresRepoImpl(getIt.get<ApiServices>()));

  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(getIt.get<ApiServices>()));

  getIt.registerSingleton<VideoRepoImpl>(
      VideoRepoImpl(getIt.get<ApiServices>()));
}
