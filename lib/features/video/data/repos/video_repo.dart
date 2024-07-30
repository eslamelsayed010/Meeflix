import 'package:dartz/dartz.dart';
import 'package:lomaTV/core/errors/failures.dart';
import 'package:lomaTV/features/video/data/models/video_model.dart';

abstract class VideoRepo {
  Future<Either<Failures, List<VideoModel>>> fetchVideoMovie({required num id});
}
