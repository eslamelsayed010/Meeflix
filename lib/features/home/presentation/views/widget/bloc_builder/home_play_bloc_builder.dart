import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/widgets/custom_error_widget.dart';
import 'package:lomaTV/features/home/presentation/manger/home_play/home_play_cubit.dart';
import 'package:lomaTV/features/home/presentation/manger/home_play/home_play_states.dart';
import 'package:lomaTV/features/home/presentation/views/widget/home_play.dart';
import 'package:lomaTV/features/home/presentation/views/widget/loading_indicator/home_play_loading_indicator.dart';
import 'dart:math';

class HomePlayBlocBuilder extends StatefulWidget {
  const HomePlayBlocBuilder({Key? key}) : super(key: key);

  @override
  State<HomePlayBlocBuilder> createState() => _HomePlayBlocBuilderState();
}

class _HomePlayBlocBuilderState extends State<HomePlayBlocBuilder> {
  @override
  void initState() {
    super.initState();
    HomePlayCubit.get(context).fetchHomePlay(id: randomNum);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePlayCubit, HomePlayState>(builder: (context, state) {
      if (state is SuccessHomePlayState) {
        return HomePlay(
          image: state.movies.backdropPath! ,
          movies: state.movies,
        );
      } else if (state is FailureHomePlayState) {
        return CustomErrorWidget(errorMassage: state.error);
      } else {
        return const HomePlayLoadingIndicator();
      }
    });
  }
}

int getRandomNumber(List<int> numbers) {
  Random random = Random();
  int randomIndex = random.nextInt(numbers.length);
  return numbers[randomIndex];
}

List<int> numbers = [28, 12, 16, 35, 80, 99, 878, 10752, 5, 10749];
int randomNum = getRandomNumber(numbers);
