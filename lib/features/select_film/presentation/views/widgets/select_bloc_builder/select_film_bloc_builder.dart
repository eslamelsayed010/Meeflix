import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/widgets/custom_error_widget.dart';
import 'package:lomaTV/core/widgets/custom_loading_indicator.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/select_film/presentation/manger/select_cubit/select_cubit.dart';
import 'package:lomaTV/features/select_film/presentation/manger/select_cubit/select_state.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/select_film_scaffold.dart';


class SelectFilmBlocBuilder extends StatelessWidget {
  const SelectFilmBlocBuilder({Key? key, required this.movieModel})
      : super(key: key);
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectCubit, SelectState>(builder: (context, state) {
      if (state is SuccessSelectState) {
        return SelectFilmScaffold(movieModel: movieModel, movieDetails: state.movieDetails);
      } else if (state is FailureSelectState) {
        return CustomErrorWidget(errorMassage: state.error);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
