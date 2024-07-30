import 'package:flutter/material.dart';

class BudgetRow extends StatelessWidget {
  const BudgetRow(
      {Key? key,
      required this.date,
      required this.budget,
      required this.duration})
      : super(key: key);
  final String date;
  final num budget;
  final num duration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text(
                'Budget',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              Text(
                '$budget\$',
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                'Duration',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              Text(
                '${duration}min',
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                'Release Date',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
