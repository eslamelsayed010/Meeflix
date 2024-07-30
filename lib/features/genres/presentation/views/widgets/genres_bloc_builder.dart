import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/widgets/custom_error_widget.dart';
import 'package:lomaTV/core/widgets/custom_loading_liner_indicator.dart';
import 'package:lomaTV/features/genres/presentation/manger/genres_cubit/genres_cubit.dart';
import 'package:lomaTV/features/genres/presentation/manger/genres_cubit/genres_states.dart';
import 'package:lomaTV/features/genres/presentation/views/genres_view.dart';

class GenresBlocBuilder extends StatelessWidget {
  const GenresBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresCubit, GenresState>(builder: (context, state) {
      if (state is SuccessGenresState) {
        return GenresListView(genreModel: state.genreModel);
      } else if (state is FailureGenresState) {
        return CustomErrorWidget(errorMassage: state.error);
      } else {
        return const CustomLoadingLinerIndicator();
      }
    });
  }
}
