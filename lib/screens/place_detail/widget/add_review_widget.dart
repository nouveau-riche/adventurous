import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/screens/add_review/add_review_screen.dart';

class AddReviewWidget extends StatelessWidget {
  final String placeName;
  final LocationDetail? location;
  final int index;
  final bool reviewAdd;

  const AddReviewWidget({
    Key? key,
    required this.placeName,
    required this.location,
    required this.index,
    required this.reviewAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Text(
            'Reviews & Ratings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () {
              if (reviewAdd) {
                showSnackBar('Already Added Review', isError: true);
                return;
              }

              Get.to(
                () => AddReviewScreen(
                  placeName: placeName,
                  location: location,
                  index: index,
                ),
                transition: Transition.downToUp,
              );
            },
            icon: const Icon(
              Icons.add,
              color: oliveColor,
              size: 20,
            ),
            label: const Text(
              'Add Review',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: oliveColor,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
