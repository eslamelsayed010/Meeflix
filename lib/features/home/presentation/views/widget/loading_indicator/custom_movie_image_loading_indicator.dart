import 'package:flutter/material.dart';

class CustomMovieImageLoadingIndicator extends StatelessWidget {
  const CustomMovieImageLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey,
        ),
      ),
    );
  }
}
