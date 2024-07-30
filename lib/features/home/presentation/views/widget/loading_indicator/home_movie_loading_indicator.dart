import 'package:flutter/material.dart';
import 'package:lomaTV/core/widgets/custom_fading_widget.dart';
import 'package:lomaTV/features/home/presentation/views/widget/loading_indicator/custom_movie_image_loading_indicator.dart';

class MovieItemLoadingIndicator extends StatelessWidget {
  const MovieItemLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 165,
            child: CustomMovieImageLoadingIndicator(),
          ),
          const SizedBox(height: 3),
          SizedBox(
            width: 100,
            child: Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 3),
          Container(
            height: 20,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
