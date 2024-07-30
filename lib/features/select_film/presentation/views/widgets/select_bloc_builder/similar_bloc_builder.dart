import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/widgets/custom_error_widget.dart';
import 'package:lomaTV/core/widgets/custom_loading_indicator.dart';
import 'package:lomaTV/features/select_film/presentation/manger/similar_cubit/similar_cubit.dart';
import 'package:lomaTV/features/select_film/presentation/manger/similar_cubit/similar_state.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/related_grid_view.dart';

class SimilarBlocBuilder extends StatelessWidget {
  const SimilarBlocBuilder({Key? key, required this.id}) : super(key: key);
  final num id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarCubit, SimilarState>(builder: (context, state) {
      if (state is SuccessSimilarState) {
        return RelatedGridView(movies: state.movies);
      } else if (state is FailureSimilarState) {
        return SliverToBoxAdapter(
          child: CustomErrorWidget(errorMassage: state.error),
        );
      } else {
        return const SliverToBoxAdapter(
          child: CustomLoadingIndicator(),
        );
      }
    });
  }
}
