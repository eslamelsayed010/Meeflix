import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/widgets/custom_error_widget.dart';
import 'package:lomaTV/features/home/presentation/manger/top_movie_ratting_cubit/top_ratting_cubit.dart';
import 'package:lomaTV/features/home/presentation/manger/top_movie_ratting_cubit/top_ratting_states.dart';
import 'package:lomaTV/features/home/presentation/views/widget/list_view_top_ratting.dart';
import 'package:lomaTV/features/home/presentation/views/widget/loading_indicator/list_view_home_view_indicator.dart';

class TopRattingBlocBuilder extends StatelessWidget {
  const TopRattingBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRattingCubit, TopRattingState>(
      builder: (context, state) {
        if (state is SuccessTopRattingState) {
          return ListViewTopRatting(movies: state.movies);
        } else if (state is FailureTopRattingState) {
          return CustomErrorWidget(errorMassage: state.error);
        } else {
          return const ListViewHomeLoadingIndicator();
        }
      },
    );
  }
}
