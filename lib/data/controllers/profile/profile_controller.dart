import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/modals/profile/user_detail_response.dart';

class ProfileController extends GetxController {
  UserProfile? userProfile;

  bool isLoading = false;

  File? profileImage;

  @override
  void onInit() {
    fetchUserProfile();
    super.onInit();
  }

  fetchUserProfile() async {
    _startLoading();

    String token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

    final response = await constCtr.apis.getUserProfile(token);

    _stopLoading();

    if (response != null) {
      userProfile = response.data;
      update();
    }
  }

  updateNameAndBio(String name, String bio, String location) {
    userProfile?.name = name;
    userProfile?.bio = bio;
    userProfile?.address = location;
    update();
  }

  updateImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final file = File(image.path);
      profileImage = file;
      update();

      String token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

      await constCtr.apis.updateImage(image: file, token: token);
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
