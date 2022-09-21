import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/review/review_controller.dart';
import 'package:adventurous_learner_app/screens/add_review/widget/rating_bar_widget.dart';
import 'package:adventurous_learner_app/screens/add_review/widget/review_image_widget.dart';

class StarAndImageReviewParentWidget extends StatelessWidget {
  const StarAndImageReviewParentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ReviewController());

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            constCtr.strings.rating,
            style: const TextStyle(
              color: kHintTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 14),
        const RatingIndicatorWidget(),
        const SizedBox(height: 30),
        Row(
          children: [
            Text(
              constCtr.strings.addPhotos,
              style: const TextStyle(
                color: kHintTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            IconButton(
              splashColor: Colors.transparent,
              onPressed: () => ctr.addImage(),
              icon: const Icon(
                Icons.add_circle_outline_outlined,
                color: oliveColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const ReviewImageWidget(),
      ],
    );
  }
}
