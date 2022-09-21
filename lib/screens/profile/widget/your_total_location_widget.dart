import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/screens/profile/all_user_location_screen.dart';

class YourTotalLocationWidget extends StatelessWidget {
  final int totalLocation;

  const YourTotalLocationWidget({
    Key? key,
    this.totalLocation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => const AllUserLocationScreen(),
          transition: Transition.downToUp,
        );
      },
      child: Container(
        height: 54,
        width: 222,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: oliveColor),
        ),
        alignment: Alignment.center,
        child: Text(
          'Your $totalLocation Visited locations',
          style: const TextStyle(
            color: oliveColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
