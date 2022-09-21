import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/data/controllers/review/review_controller.dart';

class RatingIndicatorWidget extends StatelessWidget {
  const RatingIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ReviewController());

    return GetBuilder<ReviewController>(
      builder: (_) {
        return Align(
          alignment: Alignment.centerLeft,
          child: RatingBar.builder(
            unratedColor: oliveColor,
            initialRating: 0,
            itemBuilder: (_, index) {
              if (index < ctr.rating) {
                return const Icon(
                  Icons.star,
                  color: oliveColor,
                );
              }

              return const Icon(
                Icons.star_border,
                color: oliveColor,
              );
            },
            itemCount: 5,
            itemSize: 36,
            onRatingUpdate: (rating) {
              ctr.updateRating(rating);
            },
          ),
        );
      },
    );
  }
}
