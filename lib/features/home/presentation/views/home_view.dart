import 'package:flutter/material.dart';
import 'package:lomaTV/features/home/presentation/views/widget/bloc_builder/home_view_bloc_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeViewBodyBlocBuilder(),
        // child: HomeViewBody(),
      ),
    );
  }
}
