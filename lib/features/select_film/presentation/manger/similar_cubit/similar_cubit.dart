import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/select_film/data/repo/select_repo.dart';
import 'package:lomaTV/features/select_film/presentation/manger/similar_cubit/similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.selectRepo) : super(InitialSimilarState());
  static SimilarCubit get(context) => BlocProvider.of(context);
  final SelectRepo selectRepo;

  Future<void> fetchSimilarFilm({required num id}) async {
    emit(LoadingSimilarState());
    var result = await selectRepo.fetchSimilarFilm(id: id);
    result.fold((failure) {
      emit(FailureSimilarState(failure.error));
    }, (movies) {
      emit(SuccessSimilarState(movies));
    });
  }
}
