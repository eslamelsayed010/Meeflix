import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/home/data/repos/home_repo.dart';
import 'package:lomaTV/features/home/presentation/manger/trending_person/trending_person_states.dart';

class TrendingPersonCubit extends Cubit<TrendingPersonState> {
  TrendingPersonCubit(this.homeRepo) : super(InitialTrendingPersonState());
  static TrendingPersonCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;
  Future<void> fetchTrendingPerson() async {
    emit(LoadingTrendingPersonState());
    var result = await homeRepo.fetchTrendingPerson();
    result.fold((failure) {
      emit(FailureTrendingPersonState(failure.error));
    }, (persons) {
      emit(SuccessTrendingPersonState(persons));
    });
  }
}
