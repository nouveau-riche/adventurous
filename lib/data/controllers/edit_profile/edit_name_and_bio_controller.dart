import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/profile/profile_controller.dart';

class EditNameAndBioController extends GetxController {
  String name = "";
  String bio = "";
  String location = "";

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  @override
  onInit() {
    final ctr = Get.put(ProfileController());
    name = ctr.userProfile?.name ?? '';
    bio = ctr.userProfile?.bio ?? '';
    location = ctr.userProfile?.address ?? '';
    super.onInit();
  }

  updateNameAndBio() async {
    if (!(formKey.currentState ?? FormState()).validate()) return;

    (formKey.currentState ?? FormState()).save();

    String token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

    _startLoading();

    final response = await constCtr.apis.updateNameAndBio(
      token: token,
      name: name,
      bio: bio,
      location: location,
    );

    _stopLoading();

    if (response != null) {
      Get.put(ProfileController()).updateNameAndBio(name, bio, location);
      Get.back();
      showSnackBar('Profile updated successfully');
    }
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
