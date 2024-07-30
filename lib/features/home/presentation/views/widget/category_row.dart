import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'General',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Romantic',
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            'Action',
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            'Comedy',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
