import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/home/data/repos/home_repo.dart';
import 'package:lomaTV/features/home/presentation/manger/top_movie_cubit/top_movie_states.dart';

class TopMovieCubit extends Cubit<TopMovieState> {
  TopMovieCubit(this.homeRepo) : super(InitialTopMovieState());
  static TopMovieCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  Future<void> fetchTopMovie() async {
    emit(LoadingTopMovieState());
    var result = await homeRepo.fetchTopMovies();
    result.fold((failure) {
      emit(FailureTopMovieState(failure.error));
    }, (movies) {
      emit(SuccessTopMovieState(movies));
    });
  }
}
