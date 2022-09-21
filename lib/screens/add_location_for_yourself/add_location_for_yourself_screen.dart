import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/screens/add_location_for_yourself/widget/yourself_review_field_widget.dart';
import 'package:adventurous_learner_app/screens/add_location_for_yourself/widget/yourself_address_field_widget.dart';
import 'package:adventurous_learner_app/screens/add_location_for_yourself/widget/yourself_bio_field_widget.dart';
import 'package:adventurous_learner_app/screens/add_location_for_yourself/widget/yourself_submit_location_widget.dart';
import 'package:adventurous_learner_app/screens/add_location_for_yourself/widget/yourself_learning_field_widget.dart';
import 'package:adventurous_learner_app/screens/add_location_for_yourself/widget/yourself_phone_field_widget.dart';
import 'package:adventurous_learner_app/screens/add_location_for_yourself/widget/yourself_website_field_widget.dart';
import 'package:adventurous_learner_app/screens/add_review/widget/star_and_image_review_parent_widget.dart';
import 'package:adventurous_learner_app/screens/add_location_for_yourself/widget/yourself_location_name_field_widget.dart';
import 'package:adventurous_learner_app/data/controllers/add_location_for_yourself/add_location_for_yourself_controller.dart';

class AddLocationForYourselfScreen extends StatelessWidget {
  const AddLocationForYourselfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(AddLocationForYourself());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: oliveColor,
        leading: const BackButtonWidget(color: Colors.white),
        title: const Text(
          'For Yourself',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 22, 0),
          child: Form(
            key: ctr.formKey,
            child: Column(
              children: const [
                SizedBox(height: 26),
                YourselfLocationNameFieldWidget(),
                SizedBox(height: 12),
                YourselfAddressWidget(),
                SizedBox(height: 12),
                YourselfWebsiteFieldWidget(),
                SizedBox(height: 12),
                YourselfPhoneNumberFieldWidget(),
                SizedBox(height: 12),
                YourselfBioFieldWidget(),
                SizedBox(height: 12),
                YourselfLearningOppFieldWidget(),
                SizedBox(height: 12),
                YourselfReviewFieldWidget(),
                SizedBox(height: 30),
                StarAndImageReviewParentWidget(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(35),
        child: YourselfSubmitLocationBtWidget(),
      ),
    );
  }
}
