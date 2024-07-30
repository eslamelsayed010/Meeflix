import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lomaTV/core/utils/service_locator.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/select_film/data/repo/select_repo_impl.dart';
import 'package:lomaTV/features/select_film/presentation/manger/cast_cubit/cast_cubit.dart';
import 'package:lomaTV/features/select_film/presentation/manger/select_cubit/select_cubit.dart';
import 'package:lomaTV/features/select_film/presentation/manger/similar_cubit/similar_cubit.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/select_bloc_builder/select_film_bloc_builder.dart';

class SelectFilmView extends StatelessWidget {
  const SelectFilmView({Key? key, required this.movieModel}) : super(key: key);
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectCubit(getIt.get<SelectRepoImpl>())
            ..fetchSelectFilm(id: movieModel.id!),
        ),
        BlocProvider(
          create: (context) => SimilarCubit(getIt.get<SelectRepoImpl>())
            ..fetchSimilarFilm(id: movieModel.id!),
        ),
        BlocProvider(
          create: (context) => CastCubit(getIt.get<SelectRepoImpl>())
            ..fetchCastFilm(id: movieModel.id!),
        ),
      ],
      child: SelectFilmBlocBuilder(movieModel: movieModel),
    );
  }
}


