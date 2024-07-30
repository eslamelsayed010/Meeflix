import 'package:lomaTV/features/video/data/models/video_model.dart';

abstract class VideoState {}

class InitialVideoState extends VideoState {}

class LoadingVideoState extends VideoState {}

class SuccessVideoState extends VideoState {
  final List<VideoModel> videos;
  SuccessVideoState(this.videos);
}

class FailureVideoState extends VideoState {
  final String error;
  FailureVideoState(this.error);
}
