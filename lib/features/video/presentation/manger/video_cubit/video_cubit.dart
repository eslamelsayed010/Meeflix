import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/video/data/repos/video_repo.dart';
import 'package:lomaTV/features/video/presentation/manger/video_cubit/video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(this.videoRepo) : super(InitialVideoState());
  static VideoCubit get(context) => BlocProvider.of(context);
  final VideoRepo videoRepo;

  Future<void> fetchVideo({required num id}) async {
    emit(LoadingVideoState());
    var result = await videoRepo.fetchVideoMovie(id: id);
    result.fold((failure) {
      emit(FailureVideoState(failure.error));
    }, (videos) {
      emit(SuccessVideoState(videos));
    });
  }
}
