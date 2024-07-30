import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/search/data/repos/search_repo.dart';
import 'package:lomaTV/features/search/presentation/mange/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(InitialSearchState());
  static SearchCubit get(context) => BlocProvider.of(context);
  final SearchRepo searchRepo;

  Future<void> fetchSearchMovie({required String movieName}) async {
    emit(LoadingSearchState());
    var result = await searchRepo.fetchSearchMovie(movieName: movieName);
    result.fold((failure) {
      emit(FailureSearchState(failure.error));
    }, (movies) {
      emit(SuccessSearchState(movies));
    });
  }
}
