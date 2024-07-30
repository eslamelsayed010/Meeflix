import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/widgets/custom_error_widget.dart';
import 'package:lomaTV/features/home/presentation/views/widget/loading_indicator/list_view_person_loading_indicator.dart';
import 'package:lomaTV/features/select_film/presentation/manger/cast_cubit/cast_cubit.dart';
import 'package:lomaTV/features/select_film/presentation/manger/cast_cubit/cast_state.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/cast_list_view.dart';

class CastBlocBuilder extends StatelessWidget {
  const CastBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(builder: (context, state) {
      if (state is SuccessCastState) {
        return CastListView(persons: state.person, isActing: true);
      } else if (state is FailureCastState) {
        return CustomErrorWidget(errorMassage: state.error);
      } else {
        return const ListViewPersonLoadingIndicator(isActor: true);
      }
    });
  }
}
