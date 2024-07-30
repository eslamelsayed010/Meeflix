import 'package:flutter/material.dart';

import '../../../../../core/utils/style/color_manager.dart';

class AdvancedRowSection extends StatefulWidget {
  const AdvancedRowSection({
    super.key,
  });

  @override
  State<AdvancedRowSection> createState() => _AdvancedRowSectionState();
}

class _AdvancedRowSectionState extends State<AdvancedRowSection> {
  bool isMyList = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                size: 20,
              ),
            ),
            Text(
              'Share',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 12,
              ),
            )
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                setState(() {});
                isMyList = !isMyList;
                //add toast massage
              },
              icon: isMyList
                  ? const Icon(
                      Icons.check,
                      color: Colors.red,
                    )
                  : const Icon(Icons.add),
            ),
            if (isMyList)
              Text(
                'My List',
                style: TextStyle(
                  color: ColorManager.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            else
              const Text(
                'My List',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.video_call_outlined,
                size: 20,
              ),
            ),
            Text(
              'Trailer',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 12,
              ),
            )
          ],
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
