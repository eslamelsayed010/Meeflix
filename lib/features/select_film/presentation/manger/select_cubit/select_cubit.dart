import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/select_film/data/repo/select_repo.dart';
import 'package:lomaTV/features/select_film/presentation/manger/select_cubit/select_state.dart';

class SelectCubit extends Cubit<SelectState> {
  SelectCubit(this.selectRepo) : super(InitialSelectState());
  static SelectCubit get(context) => BlocProvider.of(context);
  final SelectRepo selectRepo;

  Future<void> fetchSelectFilm({required num id}) async {
    emit(LoadingSelectState());
    var result = await selectRepo.fetchSelectFilm(id: id);
    result.fold((failure) {
      emit(FailureSelectState(failure.error));
    }, (movies) {
      emit(SuccessSelectState(movies));
    });
  }
}
