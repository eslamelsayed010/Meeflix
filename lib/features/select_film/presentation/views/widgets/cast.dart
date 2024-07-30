import 'package:flutter/material.dart';
import 'package:lomaTV/core/utils/const.dart';
import 'package:lomaTV/features/home/data/models/person_model.dart';

class Cast extends StatelessWidget {
  const Cast({Key? key, required this.personModel, this.isActor = false})
      : super(key: key);
  final PersonModel personModel;
  final bool isActor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage:
              NetworkImage('$baseImageApiUrl${personModel.profilePath}'),
        ),
        SizedBox(
          width: 70,
          child: Column(
            children: [
              const SizedBox(height: 3),
              Text(
                personModel.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
              if (isActor == false)
                Text(
                  personModel.knownForDepartment!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
