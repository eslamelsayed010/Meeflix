import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/features/edit/presentation/person_view.dart';
import 'package:lomaTV/features/home/data/models/movie_model.dart';
import 'package:lomaTV/features/home/presentation/views/home_view.dart';
import 'package:lomaTV/features/login/sign_in/presentation/view/sign_in_view.dart';
import 'package:lomaTV/features/login/sign_up/presentation/view/sign_up_view.dart';
import 'package:lomaTV/features/search/presentation/views/search_view.dart';
import 'package:lomaTV/features/select_film/presentation/views/select_film_view.dart';
import 'package:lomaTV/features/splash/presentation/views/splash_view.dart';
import 'package:lomaTV/features/video/presentation/views/video_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../features/get_start/presentation/views/get_start.dart';

abstract class AppRouter {
  static const kSignInView = '/SignInView';
  static const kSignUpView = '/SignUpView';
  static const kHomeView = '/HomeView';
  static const kGetStart = '/GetStart';
  static const kSelectFilm = '/SelectFilm';
  static const kSearchView = '/SearchView';
  static const kPersonView = '/PersonView';
  static const kVideoView = '/VideoView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: '/SignInView',
        builder: (BuildContext context, GoRouterState state) {
          return const SignInView();
        },
      ),
      GoRoute(
        path: '/SignUpView',
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpView();
        },
      ),
      GoRoute(
        path: '/HomeView',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: '/GetStart',
        builder: (BuildContext context, GoRouterState state) {
          return const GetStart();
        },
      ),
      GoRoute(
        path: '/SelectFilm',
        builder: (BuildContext context, GoRouterState state) {
          return SelectFilmView(movieModel: state.extra as MovieModel);
        },
      ),
      GoRoute(
        path: '/SearchView',
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
      GoRoute(
        path: '/PersonView',
        builder: (BuildContext context, GoRouterState state) {
          return const PersonView();
        },
      ),
      GoRoute(
        path: '/VideoView',
        builder: (BuildContext context, GoRouterState state) {
          return VideoView(
            youtubePlayerController: state.extra as YoutubePlayerController,
          );
        },
      ),
    ],
  );
}
