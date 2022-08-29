import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/extensions.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/data/controllers/map/location_detail_controller.dart';

class ReviewController extends GetxController {
  bool isLoading = false;

  final reviewTextCtr = TextEditingController();

  List<File> selectedImages = [];

  double rating = 0;

  updateRating(double value) {
    rating = value;
    update();
  }

  addImage() async {
    if (selectedImages.length == 3) {
      return showSnackBar(
        'You can only select maximum 3 images',
        isError: true,
      );
    }

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final file = File(image.path);
      selectedImages.add(file);
      update();
    }
  }

  postReview(LocationDetail? location, int index) async {
    if (validateReview()) return;

    _startLoading();

    final token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

    final response = await constCtr.apis.addRating(
      rating.toInt(),
      reviewTextCtr.text,
      location?.locationId ?? '',
      token,
      selectedImages,
    );

    if (response) {
      Get.put(LocationDetailController()).fetchLocationDetailsAfterAddingReview(
        index,
      );
    } else {
      stopLoading();
    }
  }


  removeImage(int index) {
    selectedImages.removeAt(index);
    update();
  }

  _startLoading() {
    isLoading = true;
    update();
  }

  stopLoading() {
    isLoading = false;
    update();
  }

  bool validateReview() {
    if (reviewTextCtr.text.isNullOrEmpty) {
      showSnackBar('Enter Review', isError: true);
      return true;
    }

    if (rating == 0) {
      showSnackBar('Enter Rating', isError: true);
      return true;
    }

    return false;
  }
}
