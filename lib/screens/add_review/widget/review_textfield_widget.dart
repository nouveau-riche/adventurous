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
      cursorColor: oliveColor,
      controller: ctr.reviewTextCtr,
      decoration: InputDecoration(
        hintText: constCtr.strings.review,
        hintStyle: const TextStyle(
          color: kHintTextColor,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor5, width: 1.4),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: oliveColor, width: 1.4),
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
