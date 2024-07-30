import 'package:flutter/material.dart';
import 'package:lomaTV/core/widgets/custom_fading_widget.dart';

class PersonLoadingIndicator extends StatelessWidget {
  const PersonLoadingIndicator({Key? key, this.isActor = false})
      : super(key: key);
  final bool isActor;
  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Column(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundColor: Colors.grey,
          ),
          SizedBox(
            width: 70,
            child: Column(
              children: [
                const SizedBox(height: 3),
                Container(
                  height: 15,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 3),
                if (isActor == false)
                  Container(
                    height: 7,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
