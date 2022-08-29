import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/data/controllers/review/review_controller.dart';

class ReviewTextFieldWidget extends StatelessWidget {
  const ReviewTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ReviewController());

    return TextField(
      cursorColor: greenColor2,
      controller: ctr.reviewTextCtr,
      decoration: InputDecoration(
        hintText: constCtr.strings.review,
        hintStyle: const TextStyle(
          color: kHintTextColor,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: greenColor2),
        ),
        icon: Image.asset(
          Assets.iconsReview,
          height: 20,
          width: 20,
          color: kTextFieldIconColor,
        ),
      ),
    );
  }
}
