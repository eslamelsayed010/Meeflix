import 'package:flutter/material.dart';
import 'package:lomaTV/features/get_start/presentation/manger/get_start_model.dart';

class GetStartImage extends StatelessWidget {
  const GetStartImage({Key? key, required this.getStartModel})
      : super(key: key);
  final GetStartModel getStartModel;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: double.infinity,
        child: Image.asset(
          getStartModel.image,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        bottom: MediaQuery.of(context).size.height * .2,
        left: 30,
        right: 30,
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getStartModel.title,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                getStartModel.supTitle,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[200],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
