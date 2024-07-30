import 'package:flutter/material.dart';
import 'package:lomaTV/features/home/data/models/person_model.dart';
import 'package:lomaTV/features/select_film/presentation/views/widgets/cast.dart';

class CastListView extends StatelessWidget {
  const CastListView({Key? key, required this.persons, required this.isActing}) : super(key: key);
  final List<PersonModel> persons;
  final bool isActing;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            Cast(personModel: persons[index],isActor: isActing),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: persons.length,
      ),
    );
  }
}
