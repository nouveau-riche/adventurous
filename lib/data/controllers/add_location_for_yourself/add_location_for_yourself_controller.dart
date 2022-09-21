import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/review/review_controller.dart';
import 'package:adventurous_learner_app/data/controllers/profile/user_visited_location_controller.dart';
import 'package:adventurous_learner_app/screens/add_place/widget/submit_add_place_dialog_widget.dart';

class AddLocationForYourself extends GetxController {
  bool isLoading = false;

  String locationName = "";
  String address = "";
  String website = "";
  String phoneNumber = "";
  String bio = "";
  String learningOpp = "";
  String review = "";

  final formKey = GlobalKey<FormState>();

  addLocation() async {
    if (!(formKey.currentState ?? FormState()).validate()) return;

    (formKey.currentState ?? FormState()).save();

    final ctr = Get.put(ReviewController());

    if (ctr.rating == 0.0) {
      showSnackBar('Add Rating', isError: true);
      return;
    }

    if (ctr.selectedImages.isEmpty) {
      showSnackBar('Add Review Images', isError: true);
      return;
    }

    _startLoading();

    final response = await constCtr.apis.addLocationForYourself(
      type: 'YOURSELF',
      address: address,
      name: locationName,
      contactNo: phoneNumber,
      countryCode: '+91',
      website: website,
      description: bio,
      learningOpp: learningOpp,
      rating: ctr.rating.toInt(),
      text: review,
      token: constCtr.token,
      email: '',
      yourName: '',
      images: ctr.selectedImages,
    );

    _stopLoading();

    if (response) {
      submitAddPlaceDialog(
        "Location is added on your\nprofile",
        () {
          Get.back();
          Get.back();
          Get.back();
        },
      );
    }

    Get.put(UserVisitedLocationController()).fetchUserVisitedLocation();
  }

  _startLoading() {
    isLoading = true;
    update();
  }

  _stopLoading() {
    isLoading = false;
    update();
  }
}
