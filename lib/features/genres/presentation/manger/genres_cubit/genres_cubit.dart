import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/genres/data/repos/genres_repo.dart';
import 'package:lomaTV/features/genres/presentation/manger/genres_cubit/genres_states.dart';

class GenresCubit extends Cubit<GenresState> {
  GenresCubit(this.genresRepo) : super(InitialGenresState());
  static GenresCubit get(context) => BlocProvider.of(context);

  final GenresRepo genresRepo;
  Future<void> fetchGenresMovie() async {
    emit(LoadingGenresState());
    var result = await genresRepo.fetchGenres();
    result.fold((failure) {
      emit(FailureGenresState(failure.error));
    }, (genreModel) {
      emit(SuccessGenresState(genreModel));
    });
  }
}
