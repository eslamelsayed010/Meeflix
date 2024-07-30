import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/widgets/custom_error_widget.dart';
import 'package:lomaTV/features/home/presentation/manger/trending_person/trending_person_cubit.dart';
import 'package:lomaTV/features/home/presentation/manger/trending_person/trending_person_states.dart';
import 'package:lomaTV/features/home/presentation/views/widget/loading_indicator/list_view_person_loading_indicator.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/cast_list_view.dart';

class TrendingPersonBlocBuilder extends StatelessWidget {
  const TrendingPersonBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingPersonCubit, TrendingPersonState>(
      builder: (context, state) {
        if (state is SuccessTrendingPersonState) {
          return CastListView(persons: state.persons,isActing: false);
        } else if (state is FailureTrendingPersonState) {
          return CustomErrorWidget(errorMassage: state.error);
        } else {
          return const ListViewPersonLoadingIndicator();
        }
      },
    );
  }
}
