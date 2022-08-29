import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/screens/add_review/widget/rating_bar_widget.dart';
import 'package:adventurous_learner_app/screens/add_review/widget/review_image_widget.dart';
import 'package:adventurous_learner_app/data/controllers/review/review_controller.dart';
import 'package:adventurous_learner_app/screens/add_review/widget/submit_review_bt_widget.dart';
import 'package:adventurous_learner_app/screens/add_review/widget/review_textfield_widget.dart';

class AddReviewScreen extends StatelessWidget {
  final String placeName;
  final LocationDetail? location;
  final int index;

  const AddReviewScreen({
    Key? key,
    required this.placeName,
    required this.location,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ReviewController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor3,
        leading: const BackButtonWidget(color: Colors.white),
        title: Text(
          constCtr.strings.addReview,
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  placeName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 30),
                const ReviewTextFieldWidget(),
                const SizedBox(height: 40),
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
                        color: greenColor3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const ReviewImageWidget(),
                const SizedBox(height: 110),
                SubmitReviewBtWidget(
                  location: location,
                  index: index,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
