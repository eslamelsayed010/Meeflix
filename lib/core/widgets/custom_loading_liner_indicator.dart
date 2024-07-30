import 'package:flutter/material.dart';

import '../utils/style/color_manager.dart';

class CustomLoadingLinerIndicator extends StatelessWidget {
  const CustomLoadingLinerIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: LinearProgressIndicator(
          color: ColorManager.red,
        ),
      ),
    );
  }
}