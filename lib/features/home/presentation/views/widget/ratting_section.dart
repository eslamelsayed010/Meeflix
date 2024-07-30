import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lomaTV/core/utils/style/color_manager.dart';

class RattingSection extends StatelessWidget {
  const RattingSection(
      {super.key, this.editSize = false, required this.ratting, this.size = 20});
  final num ratting;
  final bool editSize;
  final double size;
  @override
  Widget build(BuildContext context) {
    double num = ratting / 2;
    String rate = num.toStringAsFixed(1);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          rate,
          style: TextStyle(
            fontSize: editSize ? size+5 : 15,
            color: editSize ? Colors.white : Colors.grey,
          ),
        ),
        RatingBar.builder(
            itemSize: editSize ? size : 10,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            initialRating: ratting / 2,
            itemPadding: const EdgeInsets.symmetric(horizontal: 2),
            itemBuilder: (context, index) {
              return Icon(
                Icons.star,
                color: ColorManager.starColor,
              );
            },
            onRatingUpdate: (rating) {}),
      ],
    );
  }
}
