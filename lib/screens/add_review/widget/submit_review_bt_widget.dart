import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/data/controllers/review/review_controller.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';

class SubmitReviewBtWidget extends StatelessWidget {
  final LocationDetail? location;
  final int index;

  const SubmitReviewBtWidget({
    Key? key,
    required this.location,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ReviewController());

    return Center(
      child: GetBuilder<ReviewController>(
        builder: (_) {
          if (ctr.isLoading) {
            return const CupertinoActivityIndicator();
          }

          return RoundedElevatedButtonWidget(
            text: Text(
              constCtr.strings.submit,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () => ctr.postReview(location, index),
            radius: 10,
          );
        },
      ),
    );
  }
}
