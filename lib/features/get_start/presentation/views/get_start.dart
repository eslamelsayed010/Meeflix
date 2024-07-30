import 'package:flutter/material.dart';
import 'package:lomaTV/features/get_start/presentation/views/widget/get_start_page_view.dart';

class GetStart extends StatelessWidget {
  const GetStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: GetStartPageView(),
      ),
    );
  }
}
