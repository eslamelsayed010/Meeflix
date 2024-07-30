import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/widgets/custom_error_widget.dart';
import 'package:lomaTV/features/home/presentation/manger/top_movie_cubit/top_movie_cubit.dart';
import 'package:lomaTV/features/home/presentation/manger/top_movie_cubit/top_movie_states.dart';
import 'package:lomaTV/features/home/presentation/views/widget/home_app_bar.dart';
import 'package:lomaTV/features/home/presentation/views/widget/home_view_body.dart';

class HomeViewBodyBlocBuilder extends StatelessWidget {
  const HomeViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopMovieCubit, TopMovieState>(
      builder: (context, state) {
        if (state is FailureTopMovieState) {
          return Column(
            children: [
              const CustomHomeAppBar(),
              SizedBox(height: MediaQuery.of(context).size.height * .4),
              CustomErrorWidget(errorMassage: state.error),
            ],
          );
        } else {
          return const HomeViewBody();
        }
      },
    );
  }
}
