import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lomaTV/core/bloc_observer/bloc_observer.dart';
import 'package:lomaTV/core/main_function/main_func.dart';
import 'package:lomaTV/core/utils/service_locator.dart';
import 'package:lomaTV/features/genres/data/repos/genres_repo_impl.dart';
import 'package:lomaTV/features/genres/presentation/manger/genres_movie_cubit/genres_movie_cubit.dart';
import 'package:lomaTV/features/home/data/repos/home_repo_impl.dart';
import 'package:lomaTV/features/home/presentation/manger/carousel_slider/carousel_slider_cubit.dart';
import 'package:lomaTV/features/home/presentation/manger/home_play/home_play_cubit.dart';
import 'package:lomaTV/features/home/presentation/manger/top_movie_cubit/top_movie_cubit.dart';
import 'package:lomaTV/features/home/presentation/manger/top_movie_ratting_cubit/top_ratting_cubit.dart';
import 'package:lomaTV/features/home/presentation/manger/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:lomaTV/features/home/presentation/manger/trending_person/trending_person_cubit.dart';
import 'package:lomaTV/features/video/data/repos/video_repo_impl.dart';
import 'package:lomaTV/features/video/presentation/manger/video_cubit/video_cubit.dart';
import 'core/utils/app_router.dart';
import 'features/genres/presentation/manger/genres_cubit/genres_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    userState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                TopMovieCubit(getIt.get<HomeRepoImpl>())..fetchTopMovie()),
        BlocProvider(
            create: (context) => TopRattingCubit(getIt.get<HomeRepoImpl>())
              ..fetchTopRattingMovie()),
        BlocProvider(
            create: (context) => TrendingMovieCubit(getIt.get<HomeRepoImpl>())
              ..fetchTrendingMovie()),
        BlocProvider(
            create: (context) => TrendingPersonCubit(getIt.get<HomeRepoImpl>())
              ..fetchTrendingPerson()),
        BlocProvider(
            create: (context) => HomePlayCubit(getIt.get<HomeRepoImpl>())),
        BlocProvider(
            create: (context) =>
                GenresCubit(getIt.get<GenresRepoImpl>())..fetchGenresMovie()),
        BlocProvider(
            create: (context) => GenresMovieCubit(getIt.get<GenresRepoImpl>())),
        BlocProvider(
            create: (context) => VideoCubit(getIt.get<VideoRepoImpl>())),
        BlocProvider(
            create: (context) => CarouselSliderCubit(getIt.get<HomeRepoImpl>())
              ..fetchCarouselSlider()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      ),
    );
  }
}
