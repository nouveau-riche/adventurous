import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/review/review_controller.dart';
import 'package:adventurous_learner_app/screens/place_detail/place_detail_screen.dart';
import 'package:adventurous_learner_app/data/controllers/map/map_controller.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';

class LocationDetailController extends GetxController {
  bool isLoading = false;

  List<LocationDetail> locationDetails = [];

  getToken() async {
    return await constCtr.prefRepo.getUserXAccessToken() ?? '';
  }

  fetchLocationDetails(double lat, double long) async {
    _startLoading();

    String token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

    final response = await constCtr.apis.getLocationDetails(lat, long, token);

    _stopLoading();

    if (response != null && response.status!) {
      locationDetails.addAll(response.data ?? []);
      update();
      Get.put(MapController()).addMarkerForAllLocation(locationDetails);
    }
  }

  fetchLocationDetailsAfterAddingReview(int index) async {
    _startLoading();

    final mapCtr = Get.put(MapController());

    // double lat = mapCtr.currentLatitude ?? defaultLatitude;
    // double long = mapCtr.currentLongitude ?? defaultLongitude;

    double lat = defaultLatitude;
    double long = defaultLongitude;

    String token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

    final response = await constCtr.apis.getLocationDetails(lat, long, token);

    _stopLoading();

    if (response != null && response.status!) {
      showSnackBar('Review Added Successfully');
      Get.put(ReviewController()).stopLoading();

      locationDetails.clear();
      locationDetails.addAll(response.data ?? []);
      update();

      Navigator.of(Get.context!).pop();
      Navigator.of(Get.context!).pop();

      Get.to(
        () => PlaceDetailScreen(
          location: locationDetails[index],
          index: index,
        ),
        transition: Transition.rightToLeft,
      );
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
