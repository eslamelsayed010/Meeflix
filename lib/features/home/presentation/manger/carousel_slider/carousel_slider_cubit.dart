import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/features/home/data/repos/home_repo.dart';
import 'package:lomaTV/features/home/presentation/manger/carousel_slider/carousel_slider_states.dart';

class CarouselSliderCubit extends Cubit<CarouselSliderState> {
  CarouselSliderCubit(this.homeRepo) : super(InitialCarouselSliderState());
  static CarouselSliderCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;
  Future<void> fetchCarouselSlider() async {
    emit(LoadingCarouselSliderState());
    var result = await homeRepo.fetchCarouselSlider();
    result.fold((failure) {
      emit(FailureCarouselSliderState(failure.error));
    }, (movies) {
      emit(SuccessCarouselSliderState(movies));
    });
  }
}
