import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/genres/data/repos/genres_repo.dart';
import 'package:lomaTV/features/genres/presentation/manger/genres_movie_cubit/genres_movie_states.dart';

class GenresMovieCubit extends Cubit<GenresMovieState> {
  GenresMovieCubit(this.genresRepo) : super(InitialGenresMovieState());
  static GenresMovieCubit get(context) => BlocProvider.of(context);

  final GenresRepo genresRepo;
  Future<void> fetchGenresMovieId({required int id}) async {
    emit(LoadingGenresMovieState());
    var result = await genresRepo.fetchGenresMovie(id: id);
    result.fold((failure) {
      emit(FailureGenresMovieState(failure.error));
    }, (movies) {
      emit(SuccessGenresMovieState(movies));
    });
  }
}
