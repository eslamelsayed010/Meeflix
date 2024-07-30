import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/utils/service_locator.dart';
import 'package:lomaTV/features/search/data/repos/search_repo_impl.dart';
import 'package:lomaTV/features/search/presentation/mange/search_cubit/search_cubit.dart';
import 'package:lomaTV/features/search/presentation/views/widgets/search_bloc_builder/search_bloc_builder.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const SearchBlocBuilder(),
      ),
    );
  }
}
