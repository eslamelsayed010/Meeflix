import 'package:flutter/material.dart';
import 'package:lomaTV/features/home/presentation/views/widget/loading_indicator/person_loading_indicator.dart';

class ListViewPersonLoadingIndicator extends StatelessWidget {
  const ListViewPersonLoadingIndicator({Key? key,  this.isActor = false}) : super(key: key);
  final bool isActor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>  PersonLoadingIndicator(isActor: isActor),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 15,
      ),
    );
  }
}
