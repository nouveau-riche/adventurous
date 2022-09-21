import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/screens/add_review/widget/submit_review_bt_widget.dart';
import 'package:adventurous_learner_app/screens/add_review/widget/review_textfield_widget.dart';
import 'package:adventurous_learner_app/screens/add_review/widget/star_and_image_review_parent_widget.dart';

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: oliveColor,
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
                const StarAndImageReviewParentWidget(),
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
