import 'package:flutter/material.dart';
import 'package:lomaTV/features/search/presentation/views/widgets/search_result_loading_indicator.dart';

class SearchResultLoadingIndicator extends StatelessWidget {
  const SearchResultLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: SearchItemLoadingIndicator(),
        ),
        itemCount: 15,
      ),
    );
  }
}
