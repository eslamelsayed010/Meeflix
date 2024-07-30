import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lomaTV/core/errors/failures.dart';
import 'package:lomaTV/core/utils/api_services.dart';
import 'package:lomaTV/features/video/data/models/video_model.dart';
import 'package:lomaTV/features/video/data/repos/video_repo.dart';

class VideoRepoImpl extends VideoRepo {
  final ApiServices apiServices;
  VideoRepoImpl(this.apiServices);

  @override
  Future<Either<Failures, List<VideoModel>>> fetchVideoMovie(
      {required num id}) async {
    try {
      var data = await apiServices.get(endPoint: 'movie/$id/videos');
      List<VideoModel> videos = [];
      for (var videoMap in data['results']) {
        videos.add(VideoModel.fromJson(videoMap));
      }
      return right(videos);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
