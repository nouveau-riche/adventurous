import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/screens/add_visited_location/add_visited_location_screen.dart';

class AddNewVisitedLocationWidget extends StatelessWidget {
  const AddNewVisitedLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          const Text(
            'Visited Locations',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 14.5,
            ),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () {
              Get.to(
                () => const AddVisitedLocationScreen(),
                transition: Transition.downToUp,
              );
            },
            icon: const Icon(
              Icons.add,
              color: greenColor3,
              size: 17,
            ),
            label: const Text(
              'Add New Visit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: greenColor3,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
