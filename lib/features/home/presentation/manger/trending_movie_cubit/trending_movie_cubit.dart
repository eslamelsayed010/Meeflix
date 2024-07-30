import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/home/data/repos/home_repo.dart';
import 'package:lomaTV/features/home/presentation/manger/trending_movie_cubit/trending_movie_states.dart';

class TrendingMovieCubit extends Cubit<TrendingMovieState> {
  TrendingMovieCubit(this.homeRepo) : super(InitialTrendingMovieState());
  static TrendingMovieCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;
  Future<void> fetchTrendingMovie() async {
    emit(LoadingTrendingMovieState());
    var result = await homeRepo.fetchTrendingMovie();
    result.fold((failure) {
      emit(FailureTrendingMovieState(failure.error));
    }, (movies) {
      emit(SuccessTrendingMovieState(movies));
    });
  }
}
