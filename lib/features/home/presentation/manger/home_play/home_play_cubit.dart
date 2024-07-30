import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/home/data/repos/home_repo.dart';
import 'package:lomaTV/features/home/presentation/manger/home_play/home_play_states.dart';

class HomePlayCubit extends Cubit<HomePlayState> {
  HomePlayCubit(this.homeRepo) : super(InitialHomePlayState());
  static HomePlayCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;

  Future<void> fetchHomePlay({required int id}) async {
    emit(LoadingHomePlayState());
    var result = await homeRepo.fetchHomePlay(id: id);
    result.fold((failure) {
      emit(FailureHomePlayState(failure.error));
    }, (movies) {
      emit(SuccessHomePlayState(movies));
    });
  }
}
