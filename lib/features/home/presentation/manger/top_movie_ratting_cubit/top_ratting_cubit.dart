import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/home/presentation/manger/top_movie_ratting_cubit/top_ratting_states.dart';
import '../../../data/repos/home_repo.dart';

class TopRattingCubit extends Cubit<TopRattingState> {
  TopRattingCubit(this.homeRepo) : super(InitialTopRattingState());
  static TopRattingCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  Future<void> fetchTopRattingMovie() async {
    emit(LoadingTopRattingState());
    var result = await homeRepo.fetchTopRatting();
    result.fold((failure) {
      emit(FailureTopRattingState(failure.error));
    }, (movies) {
      emit(SuccessTopRattingState(movies));
    });
  }
}
