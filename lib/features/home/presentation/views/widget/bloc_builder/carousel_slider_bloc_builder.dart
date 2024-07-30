import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/widgets/custom_error_widget.dart';
import 'package:lomaTV/features/home/presentation/manger/carousel_slider/carousel_slider_cubit.dart';
import 'package:lomaTV/features/home/presentation/manger/carousel_slider/carousel_slider_states.dart';
import 'package:lomaTV/features/home/presentation/views/widget/carousel_slider_movies.dart';
import 'package:lomaTV/features/home/presentation/views/widget/loading_indicator/home_play_loading_indicator.dart';

class CarouselSliderBlocBuilder extends StatelessWidget {
  const CarouselSliderBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselSliderCubit, CarouselSliderState>(
      builder: (context, state) {
        if (state is SuccessCarouselSliderState) {
          return CarouselSliderMovies(movies: state.movies);
        } else if (state is FailureCarouselSliderState) {
          return CustomErrorWidget(errorMassage: state.error);
        } else {
          return const HomePlayLoadingIndicator();
        }
      },
    );
  }
}
