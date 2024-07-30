import 'package:flutter/material.dart';
import 'package:lomaTV/core/widgets/custom_fading_widget.dart';

class HomePlayLoadingIndicator extends StatelessWidget {
  const HomePlayLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Container(
        height: MediaQuery.of(context).size.height * .4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey,
        ),
      ),
    );
  }
}
