import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/select_film/data/repo/select_repo.dart';
import 'package:lomaTV/features/select_film/presentation/manger/cast_cubit/cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit(this.selectRepo) : super(InitialCastState());
  static CastCubit get(context) => BlocProvider.of(context);
  final SelectRepo selectRepo;

  Future<void> fetchCastFilm({required num id}) async {
    emit(LoadingCastState());
    var result = await selectRepo.fetchCast(id: id);
    result.fold((failure) {
      emit(FailureCastState(failure.error));
    }, (person) {
      emit(SuccessCastState(person));
    });
  }
}
