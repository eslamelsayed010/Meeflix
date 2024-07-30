import 'package:flutter/material.dart';
import 'package:lomaTV/features/home/presentation/views/widget/loading_indicator/home_movie_loading_indicator.dart';

class ListViewHomeLoadingIndicator extends StatelessWidget {
  const ListViewHomeLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165 + 50 + 20,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const MovieItemLoadingIndicator(),
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: 15,
      ),
    );
  }
}
